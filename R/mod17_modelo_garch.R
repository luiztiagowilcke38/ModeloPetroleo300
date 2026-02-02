# mod17_modelo_garch.R
# Autor: Luiz Tiago Wilcke
# Descrição: Ajuste de modelo GARCH para volatilidade

cat("Executando modelo GARCH...\n")

library(tseries)

df <- readRDS("data/base_consolidada.rds")
retornos <- na.omit(diff(log(df$Preco_Brent)))

# Ajuste GARCH(1,1)
modelo_garch <- garch(retornos, order = c(1, 1))
print(summary(modelo_garch))

saveRDS(modelo_garch, "output/modelo_garch.rds")

png("output/grafico_volatilidade_garch.png")
# Tentar plotar se houver fitted values, caso contrario plotar residuos quadrados
if(!is.null(modelo_garch$fitted.values)){
  plot(modelo_garch$fitted.values[,1], type="l", main="Volatilidade Condicional (GARCH)", ylab="Sigma")
} else {
  plot(retornos^2, type="l", main="Volatilidade (Retornos ao Quadrado)")
}
dev.off()

cat("Modelo GARCH ajustado.\n")
