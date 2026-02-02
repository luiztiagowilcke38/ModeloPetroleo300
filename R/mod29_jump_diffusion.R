# mod29_jump_diffusion.R
# Autor: Luiz Tiago Wilcke
# Descrição: Modelo de Difusão com Saltos de Merton (Jump Diffusion)

cat("Executando Jump Diffusion...\n")

df <- readRDS("data/base_consolidada.rds")
retornos <- diff(log(df$Preco_Brent))

# Identificar saltos (retornos > 3 desvios padrão)
limite <- 3 * sd(retornos)
saltos <- retornos[abs(retornos) > limite]
lambda_est <- length(saltos) / (length(retornos)/12) # taxa anual de saltos (aprox)
mu_jump <- mean(saltos)
sigma_jump <- sd(saltos)

params_jump <- list(lambda=lambda_est, mu_j=mu_jump, sigma_j=sigma_jump)
saveRDS(params_jump, "output/parametros_jump.rds")

cat("Parâmetros Jump Diffusion estimados:\n")
print(params_jump)
