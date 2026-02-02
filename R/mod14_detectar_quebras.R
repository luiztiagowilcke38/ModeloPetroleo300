# mod14_detectar_quebras.R
# Autor: Luiz Tiago Wilcke
# Descrição: Detecção de quebras estruturais na série de preços

cat("Detectando quebras estruturais...\n")

df <- readRDS("data/base_consolidada.rds")
ts_brent <- ts(df$Preco_Brent, start=c(1980, 1), frequency=12)

# Teste de breakpoints
bp <- breakpoints(ts_brent ~ 1)

png("output/grafico_quebras_estruturais.png", width=800, height=400)
plot(ts_brent, main="Quebras Estruturais Detectadas")
lines(bp)
dev.off()

# Salvar datas prováveis das quebras
quebras_indices <- bp$breakpoints
datas_quebras <- df$Data[quebras_indices]
write.csv(data.frame(Data_Quebra = datas_quebras), "output/datas_quebras_estruturais.csv")

cat("Quebras estruturais identificadas e salvas.\n")
