# mod34_intervalos_confianca.R
# Autor: Luiz Tiago Wilcke
# Descrição: Cálculo de Intervalos de Confiança (95%)

cat("Calculando intervalos de confiança...\n")

mc_results <- readRDS("output/monte_carlo_results.rds")

# Quantis 2.5% e 97.5%
lower <- apply(mc_results, 1, quantile, probs=0.025)
upper <- apply(mc_results, 1, quantile, probs=0.975)
mean_val <- rowMeans(mc_results)

df_ic <- data.frame(
  Mes = 1:length(mean_val),
  Media = mean_val,
  Lower = lower,
  Upper = upper
)

saveRDS(df_ic, "output/intervalos_confianca.rds")
cat("Intervalos de confiança calculados.\n")
