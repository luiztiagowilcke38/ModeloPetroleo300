# mod31_simulacao_monte_carlo.R
# Autor: Luiz Tiago Wilcke
# Descrição: Simulação de Monte Carlo com GBM Adaptado para 2026-2040 (10.000 cenários)
# Inclui Fatores Geopolíticos

cat("Iniciando Monte Carlo (10.000 simulações)...\n")

set.seed(999)
params <- readRDS("output/parametros_calibrados_final.rds")
cenarios_geo <- readRDS("data/cenarios_futuros_gpr.rds")

# Params GBM
mu <- params$GBM$mu
sigma <- params$GBM$sigma
S0 <- params$GBM$S0
n_sim <- 10000
n_periods <- nrow(cenarios_geo) # meses ate 2040

# Matriz de Resultados
# Linhas = Meses, Colunas = Simulações
matriz_precos <- matrix(NA, nrow=n_periods, ncol=n_sim)
matriz_precos[1, ] <- S0

# Loop otimizado (vetorizado por passo de tempo)
dt <- 1/12
for(i in 2:n_periods){
  dW <- rnorm(n_sim, mean=0, sd=sqrt(dt))
  
  # Fator Geopolítico do cenário Base: Se GPR > 120, aumenta volatilidade momentanea ou drift
  gpr_factor <- cenarios_geo$GPR_Base[i] / 100
  drift_adj <- mu * gpr_factor
  sigma_adj <- sigma * sqrt(gpr_factor)
  
  # Evolução S(t) = S(t-1) * exp(...)
  matriz_precos[i, ] <- matriz_precos[i-1, ] * exp((drift_adj - 0.5*sigma_adj^2)*dt + sigma_adj*dW)
}

saveRDS(matriz_precos, "output/monte_carlo_results.rds")
cat("Simulação de Monte Carlo concluída.\n")
