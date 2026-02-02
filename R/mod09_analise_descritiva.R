# mod09_analise_descritiva.R
# Autor: Luiz Tiago Wilcke
# Descrição: Estatísticas descritivas básicas das variáveis

cat("Iniciando análise descritiva...\n")

df <- readRDS("data/base_consolidada.rds")

# Resumo estatístico
resumo <- summary(df)
print(resumo)

# Histograma simples para visualização rápida no console
cat("Histograma do Preço do Brent:\n")
hist(df$Preco_Brent, main="Distribuição do Preço do Petróleo", col="blue", breaks=30)

# Salvar resumo em texto
capture.output(resumo, file = "output/resumo_estatistico.txt")
cat("Resumo estatístico salvo em 'output/resumo_estatistico.txt'.\n")
