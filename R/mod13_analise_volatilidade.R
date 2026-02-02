# mod13_analise_volatilidade.R
# Autor: Luiz Tiago Wilcke
# Descrição: Análise de volatilidade histórica (Janela Móvel)

cat("Analisando volatilidade...\n")

df <- readRDS("data/base_consolidada.rds")
# Retornos logarítmicos
retornos <- diff(log(df$Preco_Brent))

# Volatilidade móvel (30 dias ~ 1 mês)
vol_movel <- zoo::rollapply(retornos, width=30, FUN=sd, fill=NA)

png("output/grafico_volatilidade_historica.png", width=800, height=400)
plot(df$Data[-1], vol_movel, type="l", col="red", main="Volatilidade Histórica (Janela 30 dias)", ylab="Desvio Padrão", xlab="Ano")
dev.off()

cat("Análise de volatilidade concluída.\n")
