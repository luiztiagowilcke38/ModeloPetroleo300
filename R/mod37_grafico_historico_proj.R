# mod37_grafico_historico_proj.R
# Autor: Luiz Tiago Wilcke
# Descrição: Gráfico Unificado (Histórico + Projeção)

cat("Gerando gráfico Histórico + Projeção...\n")

library(ggplot2)

df_hist <- readRDS("data/base_consolidada.rds")
df_proj <- readRDS("output/projecao_final_consolidada.rds")

# Ajuste nomes para bind
hist_plot <- data.frame(Data=df_hist$Data, Preco=df_hist$Preco_Brent, Tipo="Histórico")
proj_plot <- data.frame(Data=df_proj$Data, Preco=df_proj$Preco_Previsto, Tipo="Projeção")
df_total <- rbind(hist_plot, proj_plot)

p <- ggplot(df_total, aes(x=Data, y=Preco, color=Tipo)) +
  geom_line(size=1) +
  theme_minimal() +
  labs(title="Preço do Petróleo: Histórico e Previsão (1980-2040)",
       subtitle="Modelo Estocástico com Variáveis Geopolíticas",
       y="Preço (USD/Barril)", x="Ano", caption="Autor: Luiz Tiago Wilcke") +
  scale_color_manual(values=c("black", "blue"))

ggsave("output/grafico_historico_projecao.png", p, width=10, height=6)
cat("Gráfico 37 gerado.\n")
