# mod24_impacto_geopolitico.R
# Autor: Luiz Tiago Wilcke
# Descrição: Análise de Impulso-Resposta (IRF) para choques geopolíticos

cat("Analisando impacto geopolítico (IRF)...\n")

var_model <- readRDS("output/modelo_var.rds")

# Impulse Response Function: Choque no GPR -> Resposta no Preço
irf_gpr <- irf(var_model, impulse="Indice_GPR", response="Preco_Brent", n.ahead=20, boot=TRUE)

png("output/grafico_impulso_resposta_gpr.png")
plot(irf_gpr, main="Resposta do Preço ao Choque Geopolítico")
dev.off()

cat("Análise de impacto geopolítico concluída.\n")
