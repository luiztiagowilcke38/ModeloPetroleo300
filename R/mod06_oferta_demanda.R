# mod06_oferta_demanda.R
# Autor: Luiz Tiago Wilcke
# Descrição: Dados de Produção (OPEP + Não-OPEP) e Demanda Global

cat("Gerando dados de oferta e demanda...\n")

# Ler dados históricos para alinhar n
df_hist <- read.csv("data/dados_historicos_petroleo.csv")
n <- nrow(df_hist)
datas <- as.Date(df_hist$Data)

set.seed(101)

# Produção (milhões de barris/dia) - Tendência de alta leve
producao <- seq(60, 100, length.out = n) + rnorm(n, 0, 1)

# Demanda - Segue PIB mas com elasticidade
demanda <- producao + rnorm(n, 0, 0.5) # Mercado próximo do equilíbrio

df_supply_demand <- data.frame(
  Data = datas,
  Producao_Global = producao,
  Demanda_Global = demanda
)

write.csv(df_supply_demand, "data/dados_oferta_demanda.csv", row.names = FALSE)
cat("Dados de oferta e demanda gerados.\n")
