# mod19_prophet.R
# Autor: Luiz Tiago Wilcke
# Descrição: Previsão com Facebook Prophet

cat("Executando modelo Prophet...\n")

df <- readRDS("data/base_consolidada.rds")
df_prophet <- data.frame(ds = df$Data, y = df$Preco_Brent)

# Ajuste do modelo
m <- prophet(df_prophet, daily.seasonality=FALSE, weekly.seasonality=FALSE)

# Futuro
future <- make_future_dataframe(m, periods = 24, freq = "month")
forecast_prophet <- predict(m, future)

saveRDS(m, "output/modelo_prophet.rds")

png("output/grafico_previsao_prophet.png")
plot(m, forecast_prophet) + ggtitle("Previsão Prophet")
dev.off()

cat("Modelo Prophet ajustado.\n")
