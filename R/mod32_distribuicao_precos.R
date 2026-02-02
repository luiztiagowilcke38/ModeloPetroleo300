# mod32_distribuicao_precos.R
# Autor: Luiz Tiago Wilcke
# Descrição: Análise da Distribuição dos Preços Finais em 2040

cat("Analisando distribuição final (2040)...\n")

matriz_mc <- readRDS("output/monte_carlo_results.rds")
precos_final_2040 <- matriz_mc[nrow(matriz_mc), ]

# Estatísticas
media_final <- mean(precos_final_2040)
mediana_final <- median(precos_final_2040)
q05 <- quantile(precos_final_2040, 0.05)
q95 <- quantile(precos_final_2040, 0.95)

stats_mc <- data.frame(Media=media_final, Mediana=mediana_final, Q05=q05, Q95=q95)
print(stats_mc)
write.csv(stats_mc, "output/estatisticas_monte_carlo.csv")

png("output/histograma_monte_carlo_2040.png")
hist(precos_final_2040, breaks=50, col="skyblue", main="Distribuição Projetada do Preço (2040)", xlab="Preço USD/Barril")
abline(v=media_final, col="red", lwd=2)
dev.off()

cat("Distribuição analisada.\n")
