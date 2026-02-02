# mod03_limpeza_dados.R
# Autor: Luiz Tiago Wilcke
# Descrição: Verificação e limpeza de dados (Outliers, NAs)

cat("Executando limpeza de dados...\n")

df <- read.csv("data/dados_historicos_petroleo.csv")
df$Data <- as.Date(df$Data)

# Checar NAs
na_count <- sum(is.na(df))
if(na_count > 0){
  cat("Encontrados", na_count, "valores NA. Realizando imputação linear...\n")
  df$Preco_Brent <- na.approx(df$Preco_Brent, rule=2)
}

# Tratamento básico de Outliers (Winsorizing leve se necessário, aqui apenas log para verificação)
# Não removeremos outliers pois crises são importantes para o modelo

cat("Limpeza concluída.\n")
stock_data <- df
