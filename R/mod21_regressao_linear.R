# mod21_regressao_linear.R
# Autor: Luiz Tiago Wilcke
# Descrição: Modelo de Regressão Linear Múltipla com variáveis macro e geopolíticas

cat("Executando Regressão Linear Múltipla...\n")

df <- readRDS("data/base_consolidada.rds")

# Modelo
lm_model <- lm(Preco_Brent ~ Producao_Global + Demanda_Global + Dolar_Index + Indice_GPR + Indice_Renovaveis, data=df)

print(summary(lm_model))

saveRDS(lm_model, "output/modelo_regressao_linear.rds")

png("output/grafico_regressao_linear_fit.png")
plot(df$Data, df$Preco_Brent, type="l", col="black", main="Regressão Linear: Real vs Ajustado")
lines(df$Data, fitted(lm_model), col="red")
legend("topleft", legend=c("Real", "Ajustado"), col=c("black", "red"), lty=1)
dev.off()

cat("Modelo de Regressão Linear ajustado.\n")
