# mod05_indicadores_macro.R
# Autor: Luiz Tiago Wilcke
# Descrição: Indicadores Macroeconômicos (PIB Global, Inflação EUA, Dólar Index)

cat("Gerando indicadores macroeconômicos...\n")

# Ler dados históricos para alinhar n
df_hist <- read.csv("data/dados_historicos_petroleo.csv")
n <- nrow(df_hist)
datas <- as.Date(df_hist$Data)

set.seed(789)

# Simulação Dólar Index (DXY) - correlação negativa com commodities geralmente
dxy <- 100 + cumsum(rnorm(n, 0, 1))

# PIB Global (Crescimento percentual)
pib_global <- 3 + rnorm(n, 0, 1.5)

df_macro <- data.frame(
  Data = datas,
  Dolar_Index = dxy,
  Crescimento_PIB_Global = pib_global
)

write.csv(df_macro, "data/dados_macro.csv", row.names = FALSE)
cat("Dados macroeconômicos gerados.\n")
