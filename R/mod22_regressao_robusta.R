# mod22_regressao_robusta.R
# Autor: Luiz Tiago Wilcke
# Descrição: Regressão Robusta (menos sensível a outliers)

cat("Executando Regressão Robusta...\n")

library(MASS)
df <- readRDS("data/base_consolidada.rds")

# Modelo robusto (Huber M-estimator)
rlm_model <- rlm(Preco_Brent ~ Producao_Global + Demanda_Global + Dolar_Index + Indice_GPR, data=df)

print(summary(rlm_model))
saveRDS(rlm_model, "output/modelo_regressao_robusta.rds")

cat("Modelo de Regressão Robusta ajustado.\n")
