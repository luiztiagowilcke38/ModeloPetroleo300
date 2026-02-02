# mod40_grafico_densidade_final.R
# Autor: Luiz Tiago Wilcke
# Descrição: Densidade de Probabilidade do Preço em 2040

cat("Gerando gráfico de densidade final...\n")

matriz_mc <- readRDS("output/monte_carlo_results.rds")
precos_2040 <- matriz_mc[nrow(matriz_mc), ]

png("output/grafico_densidade_2040.png", width=800, height=500)
d <- density(precos_2040)
plot(d, main="Distribuição de Probabilidade do Preço em 2040", 
     xlab="Preço (USD)", col="darkgreen", lwd=2, type="l")
polygon(d, col=rgb(0, 0.5, 0, 0.3), border="darkgreen")
grid()
dev.off()

cat("Gráfico 40 gerado.\n")
cat("=== TODOS OS 40 MÓDULOS FORAM EXECUTADOS COM SUCESSO ===\n")
