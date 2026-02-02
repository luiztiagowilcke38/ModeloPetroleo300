# mod25_cenarios_conflito.R
# Autor: Luiz Tiago Wilcke
# Descrição: Definição de cenários futuros de conflito (2026-2040)

cat("Definindo cenários de conflito...\n")

# Período de previsão: 15 anos * 12 meses = 180 meses
anos_futuros <- seq(as.Date("2026-01-01"), as.Date("2040-12-31"), by="month")
n_futuro <- length(anos_futuros)

# Cenário Base: GPR constante na média histórica
gpr_base <- rep(100, n_futuro)

# Cenário ALTA Tensão: GPR sobe gradualmente 50%
gpr_alta <- seq(100, 150, length.out=n_futuro)

# Cenário BAIXA Tensão: GPR cai para 80
gpr_baixa <- seq(100, 80, length.out=n_futuro)

df_cenarios <- data.frame(
  Data = anos_futuros,
  GPR_Base = gpr_base,
  GPR_Alta = gpr_alta,
  GPR_Baixa = gpr_baixa
)

saveRDS(df_cenarios, "data/cenarios_futuros_gpr.rds")
cat("Cenários de conflito definidos e salvos.\n")
