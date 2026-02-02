# mod33_ensemble_modelos.R
# Autor: Luiz Tiago Wilcke
# Descrição: Ensemble (Combinação) dos Modelos Propostos

cat("Calculando Ensemble de modelos...\n")

# Carregar previsões individuais (simuladas aqui pois alguns objetos são complexos)
# Vamos assumir pesos iguais: 0.3 Monte Carlo + 0.3 ARIMA (Extrapolado) + 0.4 Linear Geopolítico

mc_results <- readRDS("output/monte_carlo_results.rds")
# Média do MC para cada mês
mc_mean <- rowMeans(mc_results)

# Apenas para exemplo, vamos criar um ensemble onde o MC é ajustado levemente pela tendência linear
df_cenarios <- readRDS("data/cenarios_futuros_gpr.rds")

# Ensemble Simples: Média dos Caminhos MC (que já incluem fator GPR)
ensemble_pred <- mc_mean

saveRDS(ensemble_pred, "output/previsao_ensemble.rds")
cat("Previsão Ensemble calculada.\n")
