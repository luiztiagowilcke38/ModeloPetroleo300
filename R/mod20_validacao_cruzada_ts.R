# mod20_validacao_cruzada_ts.R
# Autor: Luiz Tiago Wilcke
# Descrição: Validação Cruzada (Time Series Cross Validation)

cat("Realizando validação cruzada...\n")

df <- readRDS("data/base_consolidada.rds")
ts_brent <- ts(df$Preco_Brent, start=c(1980, 1), frequency=12)

# Função para calcular erro (RMSE) em janelas deslizantes
# Simplificação: Dividir treino/teste nas ultimas 24 obs
n <- length(ts_brent)
treino <- window(ts_brent, end=c(time(ts_brent)[n-24]))
teste <- window(ts_brent, start=c(time(ts_brent)[n-23]))

# Testar modelos no conjunto de teste
fit_arima <- auto.arima(treino)
fcast_arima <- forecast(fit_arima, h=24)
rmse_arima <- sqrt(mean((teste - fcast_arima$mean)^2))

fit_ets <- ets(treino)
fcast_ets <- forecast(fit_ets, h=24)
rmse_ets <- sqrt(mean((teste - fcast_ets$mean)^2))

cat("RMSE ARIMA:", rmse_arima, "\n")
cat("RMSE ETS:", rmse_ets, "\n")

resultados_cv <- data.frame(Modelo = c("ARIMA", "ETS"), RMSE = c(rmse_arima, rmse_ets))
write.csv(resultados_cv, "output/resultados_validacao_cruzada.csv")

cat("Validação cruzada concluída.\n")
