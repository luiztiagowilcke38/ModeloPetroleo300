# mod07_transicao_energetica.R
# Autor: Luiz Tiago Wilcke
# Descrição: Variáveis de Energia Renovável (Impacto substitutivo)

cat("Gerando variáveis de transição energética...\n")

# Ler dados históricos para alinhar n
df_hist <- read.csv("data/dados_historicos_petroleo.csv")
n <- nrow(df_hist)
datas <- as.Date(df_hist$Data)

# Adoção de renováveis cresce exponencialmente a partir de 2000
anos <- as.numeric(format(datas, "%Y"))
adocao_renovavel <- ifelse(anos < 2000, 0, (anos - 2000)^2 * 0.05)

df_renovavel <- data.frame(
  Data = datas,
  Indice_Renovaveis = adocao_renovavel
)

write.csv(df_renovavel, "data/dados_transicao_energetica.csv", row.names = FALSE)
cat("Dados de transição energética gerados.\n")
