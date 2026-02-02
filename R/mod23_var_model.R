# mod23_var_model.R
# Autor: Luiz Tiago Wilcke
# Descrição: Modelo de Vetores Auto-Regressivos (VAR)

cat("Executando modelo VAR...\n")

library(vars)
df <- readRDS("data/base_consolidada.rds")

# Selecionar variáveis para o VAR (Preço e GPR)
dados_var <- df[, c("Preco_Brent", "Indice_GPR", "Dolar_Index")]
dados_var <- na.omit(dados_var)

# Seleção de lag
lag_select <- VARselect(dados_var, lag.max=10, type="const")
print(lag_select$selection)

# Ajuste VAR
# Usando lag 2 por simplicidade ou o sugerido
var_model <- VAR(dados_var, p=2, type="const")
print(summary(var_model))

# Previsão
var_pred <- predict(var_model, n.ahead=24)

saveRDS(var_model, "output/modelo_var.rds")
png("output/grafico_previsao_var.png")
plot(var_pred)
dev.off()

cat("Modelo VAR ajustado.\n")
