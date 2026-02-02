# mod04_variaveis_geopoliticas.R
# Autor: Luiz Tiago Wilcke
# Descrição: Criação de Índice de Risco Geopolítico (GPR) Simulado

cat("Gerando variáveis geopolíticas...\n")

# Ler dados históricos para alinhar datas e tamanho (n)
df_hist <- read.csv("data/dados_historicos_petroleo.csv")
n <- nrow(df_hist)
datas <- as.Date(df_hist$Data)

# O GPR (Geopolitical Risk Index) tende a ter picos em guerras e crises
set.seed(456)
gpr_base <- abs(rnorm(n, mean=100, sd=20))

# Adicionando choques aleatórios (ex: guerras)
indices_choque <- sample(1:n, size=15)
gpr_base[indices_choque] <- gpr_base[indices_choque] * runif(15, 2, 4)

df_gpr <- data.frame(
  Data = datas,
  Indice_GPR = gpr_base
)

write.csv(df_gpr, "data/dados_geopoliticos.csv", row.names = FALSE)
cat("Índice GPR gerado.\n")
