clear;
close all;
clc;
rng(1);

tic;

%% DGP
n = 4000;
q = 2;
k =4;
beta = [1 : k]';
rho = 1 / 4;
Omega = (1 - rho) * eye(q) + rho * ones(q);
X = NaN(n * q, k);
y = NaN(n * q, 1);

for i = 1:n
    Xi = [ones(q, 1) mvnrnd(zeros(1, k-1), eye(k - 1), q)];
    yi = Xi * beta + mvnrnd(zeros(1, q), Omega)';
    X((i - 1) * q + 1 : i * q, :) = Xi;
    y((i - 1) * q + 1 : i * q) = yi;
end

Y = reshape(y,q,n)';

%% OLS
b_OLS = ((X' * X)^(-1)) * X' * y;
e_total = y - X * b_OLS;


[e_total_row, e_total_column] = size(e_total);
e_1 = ones(n, 1);
e_2 = ones(n, 1);

%% FGLS
for j = 1 : n
    e_1(j) = e_total(2 * j - 1);
    e_2(j) = e_total(2 * j);
end

residual = [e_1 e_2];
Omega_hat = zeros(2, 2);

for t = 1 : n
    Omega_hat = residual(t, :)' * residual(t, :) + Omega_hat;
end

Omega_hat = Omega_hat / n;

FGLS_firstPart = zeros(k, k);
FGLS_secondPart = zeros(k, 1);

for l = 1: n
   FGLS_firstPart = FGLS_firstPart + X((2 * l - 1) : 2 * l, :)' * ...
       Omega_hat^-1 * X((2 * l - 1) : 2 * l, :);
end

for l = 1: n
   FGLS_secondPart = FGLS_secondPart + ...
       X((2 * l - 1) : 2 * l, :)' * Omega_hat^-1 * Y(l, :)';
end

b_FGLS = inv(FGLS_firstPart) * FGLS_secondPart;
stderor = sqrtm(inv(FGLS_firstPart)./n);

%% Gibbs Sampling
counter = 11000;
burn = 1000; 
expost = counter - burn;
b0 = zeros(k, 1); 
B0 = 10 * eye(k);
nu = q + 2;
S = eye(q) / 10;
beta_vector = NaN(k, expost);
Omega_vector = NaN(q, q, expost);
Omega = S;

for iter = 1:counter
    Bhat = inv(inv(B0) + X' * kron(speye(n), inv(Omega)) * X);
    Bhat = (Bhat + Bhat') / 2;
    bhat = Bhat * (B0 \ b0 + X' * kron(speye(n), inv(Omega)) * y);
    Beta = mvnrnd(bhat, Bhat)';
    M = reshape(X * Beta, q, n)';
    Omega = iwishrnd(S + (Y - M)' * (Y - M), nu + n);
    if iter > burn
        beta_vector(:, iter - burn) = Beta;
        Omega_vector(:, :, iter - burn) = Omega;
    end
end

 %% Posterior Means
 b_Gibbs = mean(beta_vector, 2);
 Omega_Gibbs = mean (Omega_vector, 3);
 stande_O = std(Omega_vector,0,3);
 stande_b = std(beta_vector,0,2); 
 
 toc