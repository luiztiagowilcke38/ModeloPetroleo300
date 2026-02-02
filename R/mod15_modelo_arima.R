# mod15_modelo_arima.R
# Autor: Luiz Tiago Wilcke
# Descrição: Ajuste e previsão com Modelo ARIMA

cat("Executando modelo ARIMA...\n")

df <- readRDS("data/base_consolidada.rds")
ts_brent <- ts(df$Preco_Brent, start=c(1980, 1), frequency=12)

# Auto ARIMA - Seleção automática do melhor modelo
modelo_arima <- auto.arima(ts_brent, stepwise=FALSE, approximation=FALSE)
print(summary(modelo_arima))

# Previsão curto prazo (24 meses)
prev_arima <- forecast(modelo_arima, h=24)

saveRDS(modelo_arima, "output/modelo_arima.rds")
png("output/grafico_previsao_arima.png")
plot(prev_arima, main="Previsão ARIMA (24 meses)")
dev.off()

cat("Modelo ARIMA ajustado e previsões salvas.\n")
