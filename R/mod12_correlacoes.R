# mod12_correlacoes.R
# Autor: Luiz Tiago Wilcke
# Descrição: Matriz de correlação entre preço e variáveis explicativas

cat("Calculando correlações...\n")

df <- readRDS("data/base_consolidada.rds")

# Selecionar apenas colunas numéricas
nums <- unlist(lapply(df, is.numeric))
df_num <- df[ , nums]

matriz_corr <- cor(df_num, use="complete.obs")

# Salvar matriz
write.csv(matriz_corr, "output/matriz_correlacao.csv")

# Plot simples (se tiver pacote corrplot seria melhor, mas faremos image básico)
png("output/grafico_correlacao.png", width=600, height=600)
image(1:ncol(matriz_corr), 1:nrow(matriz_corr), t(matriz_corr), axes=FALSE, ann=FALSE, col=heat.colors(12))
axis(1, at=1:ncol(matriz_corr), labels=colnames(matriz_corr), las=2, cex.axis=0.7)
axis(2, at=1:nrow(matriz_corr), labels=colnames(matriz_corr), las=2, cex.axis=0.7)
title("Matriz de Correlação")
dev.off()

cat("Matriz de correlação salva.\n")
