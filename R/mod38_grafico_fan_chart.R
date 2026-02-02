# mod38_grafico_fan_chart.R
# Autor: Luiz Tiago Wilcke
# Descrição: Gráfico 'Fan Chart' (Incerteza)

cat("Gerando Fan Chart...\n")

df_proj <- readRDS("output/projecao_final_consolidada.rds")

p <- ggplot(df_proj, aes(x=Data)) +
  geom_ribbon(aes(ymin=IC_Inferior, ymax=IC_Superior), fill="lightblue", alpha=0.5) +
  geom_line(aes(y=Preco_Previsto), color="darkblue", size=1) +
  theme_minimal() +
  labs(title="Previsão com Intervalo de Confiança 95%",
       y="Preço (USD)", x="Ano")

ggsave("output/grafico_fan_chart.png", p, width=10, height=6)
cat("Gráfico 38 gerado.\n")
