# Seemingly-Unrelated-Regression

Wikipedia : https://en.wikipedia.org/wiki/Seemingly_unrelated_regressions

The SUR model, proposed by Arnold Zellner in (1962), is also known as the `seemingly related regression` since the error terms are correlated across equations.

- Model:

<img src="https://render.githubusercontent.com/render/math?math=\begin{pmatrix}y_1 \\\ y_2 \\\ y_3 \\\ y_4\end{pmatrix}="><img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Bpmatrix%7DX_1+%26+0+%26+0+%26+0%5C%5C%5C+0+%26+X_2+%26+0+%26+0%5C%5C%5C+0+%26+0+%26+X_3+%26+0%5C%5C%5C+0+%26+0+%26+0+%26+X_4%5Cend%7Bpmatrix%7D" 
alt="\begin{pmatrix}X_1 & 0 & 0 & 0\\\ 0 & X_2 & 0 & 0\\\ 0 & 0 & X_3 & 0\\\ 0 & 0 & 0 & X_4\end{pmatrix}"><img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Bpmatrix%7D%5Cbeta_1+%5C%5C%5C+%5Cbeta_2+%5C%5C%5C+%5Cbeta_3+%5C%5C%5C+%5Cbeta_4%5Cend%7Bpmatrix%7D%2B" 
alt="\begin{pmatrix}\beta_1 \\\ \beta_2 \\\ \beta_3 \\\ \beta_4\end{pmatrix}+"><img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Bpmatrix%7D%5Cepsilon_1+%5C%5C%5C+%5Cepsilon_2+%5C%5C%5C+%5Cepsilon_3+%5C%5C%5C+%5Cepsilon_4%5Cend%7Bpmatrix%7D" 
alt="\begin{pmatrix}\epsilon_1 \\\ \epsilon_2 \\\ \epsilon_3 \\\ \epsilon_4\end{pmatrix}">

- Stack: <img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+y_%7Bi%7D%3DX_i%5Cbeta_i%2B%5Cepsilon_%7Bi%7D%2C+%5C+%5C+i%3D1%2C2%2C3%2C4" 
alt="y_{i}=X_i\beta_i+\epsilon_{i}, \ \ i=1,2,3,4"> where <img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+y_i" 
alt="y_i"> and <img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cepsilon_i" 
alt="\epsilon_i"> are <img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+4%5Ctimes+1" 
alt="4\times 1">, <img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+X_i" 
alt="X_i"> is <img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+4%5Ctimes+k_i" 
alt="4\times k_i">, and <img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbeta_i" 
alt="\beta_i"> has dimension <img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+k_i+%5Ctimes+1" 
alt="k_i \times 1"> with <img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+k_i" 
alt="k_i"> is the vector of regressors for equation <img src=
"https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+i" 
alt="i">.

---

### DGP

- The data generating process specifies the true ![formula](https://render.githubusercontent.com/render/math?math=\beta=[1,2,3,4] ).



### Estimation

1. Estimate with **feasible GLS**
	- <img src="https://render.githubusercontent.com/render/math?math=\widehat{\beta}=[0.9840, 2.0059, 3.0049, 4.0059]">

2. Estimate with **Gibbs Sampling**
	- Burn in period: 1000
	- <img src="https://render.githubusercontent.com/render/math?math=\widehat{\beta}=[0.9841, 2.0058, 3.0050, 4.0060]">
