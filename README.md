# Seemingly-Unrelated-Regression

Wikipedia : https://en.wikipedia.org/wiki/Seemingly_unrelated_regressions

The SUR model, proposed by Arnold Zellner in (1962), is also known as the "seemingly related regression" since the error terms are correlated across equations.

- Model:

$$\begin{pmatrix}y_1 \\\ y_2 \\\ y_3 \\\ y_4\end{pmatrix}=\begin{pmatrix}X_1 & 0 & 0 & 0\\\ 0 & X_2 & 0 & 0\\\ 0 & 0 & X_3 & 0\\\ 0 & 0 & 0 & X_4\end{pmatrix} \begin{pmatrix}\beta_1 \\\ \beta_2 \\\ \beta_3 \\\ \beta_4\end{pmatrix}+\begin{pmatrix}\epsilon_1 \\\ \epsilon_2 \\\ \epsilon_3 \\\ \epsilon_4\end{pmatrix}$$

- Stack: $y_{i}=X_i\beta_i+\epsilon_{i}, \ \ i=1,2,3,4$ where $y_i$ and $\epsilon_i$ are $4\times 1$, $X_i$ is $4\times k_i$, and $\beta_i$ has dimension $k_i \times 1$ with $k_i$ is the vector of regressors for equation $i$.

--

### DGP

- The data generating process specifies the true $\beta=$ [1,2,3,4].



### Estimation

1. Estimate with **feasible GLS**
	- $\widehat{\beta}=$ [0.9840, 2.0059, 3.0049, 4.0059]

2. Estimate with **Gibbs Sampling**
	- Burn in period: 1000
	- $\widehat{\beta}=$ [0.9841, 2.0058, 3.0050, 4.0060]