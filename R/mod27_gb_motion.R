# mod27_gb_motion.R
# Autor: Luiz Tiago Wilcke
# Descrição: Modelo de Movimento Browniano Geométrico (GBM)

cat("Executando GBM...\n")

df <- readRDS("data/base_consolidada.rds")
# Parâmetros: drift (mu) e volatilidade (sigma)
retornos <- diff(log(df$Preco_Brent))
mu <- mean(retornos)
sigma <- sd(retornos)

# Simulação simples de 1 caminho para visualização
S0 <- tail(df$Preco_Brent, 1)
T <- 15 # anos
N <- 15 * 12 # meses
dt <- T/N
t <- seq(0, T, by=dt)
W <- c(0, cumsum(rnorm(N, mean=0, sd=sqrt(dt))))
St <- S0 * exp((mu - 0.5*sigma^2)*t + sigma*W)

png("output/grafico_simulacao_gbm_exemplo.png")
plot(t, St, type="l", main="Exemplo de Caminho GBM (15 anos)")
dev.off()

params_gbm <- list(mu=mu, sigma=sigma, S0=S0)
saveRDS(params_gbm, "output/parametros_gbm.rds")

cat("Parâmetros GBM calculados.\n")
