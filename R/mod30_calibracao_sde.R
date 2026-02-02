# mod30_calibracao_sde.R
# Autor: Luiz Tiago Wilcke
# Descrição: Calibração Final dos Modelos Estocásticos

cat("Calibrando modelos SDE...\n")

# Carrega parametros
p_gbm <- readRDS("output/parametros_gbm.rds")
p_ou <- readRDS("output/parametros_ou.rds")
p_jump <- readRDS("output/parametros_jump.rds")

# Consolida em objeto unico para simulação
parametros_finais <- list(
  GBM = p_gbm,
  OU = p_ou,
  Merton = p_jump
)

saveRDS(parametros_finais, "output/parametros_calibrados_final.rds")
cat("Calibração SDE finalizada.\n")
