# mod10_decomposicao_serie.R
# Autor: Luiz Tiago Wilcke
# Descrição: Decomposição da Série Temporal (Tendência, Sazonalidade, Resíduo)

cat("Executando decomposição da série temporal...\n")

df <- readRDS("data/base_consolidada.rds")
ts_brent <- ts(df$Preco_Brent, start=c(1980, 1), frequency=12)

# Decomposição STL
decomp <- stl(ts_brent, s.window="periodic")

# Salvar gráfico da decomposição
png("output/grafico_decomposicao.png", width=800, height=600)
plot(decomp, main="Decomposição STL - Preço do Petróleo")
dev.off()

cat("Decomposição salva em 'output/grafico_decomposicao.png'.\n")
