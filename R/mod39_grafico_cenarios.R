# mod39_grafico_cenarios.R
# Autor: Luiz Tiago Wilcke
# Descrição: Comparativo de Cenários (Base vs Alta Tensão)

cat("Gerando Comparativo de Cenários...\n")

# Para simplificar a visualização, vamos simular que o PREÇO segue proporcionalmente o GPR
# Re-ler cenários
cenarios <- readRDS("data/cenarios_futuros_gpr.rds")
# Projecao base ja calculada
df_proj <- readRDS("output/projecao_final_consolidada.rds")

# Criar precos ficticios para cenarios alternativos baseados na diferenca de GPR
fator_alta <- cenarios$GPR_Alta / cenarios$GPR_Base
fator_baixa <- cenarios$GPR_Baixa / cenarios$GPR_Base

preco_alta <- df_proj$Preco_Previsto * fator_alta
preco_baixa <- df_proj$Preco_Previsto * fator_baixa

df_plot <- data.frame(
  Data = rep(cenarios$Data, 3),
  Preco = c(df_proj$Preco_Previsto, preco_alta, preco_baixa),
  Cenario = rep(c("Cenário Base", "Alta Tensão Geopolítica", "Baixa Tensão"), each=nrow(cenarios))
)

p <- ggplot(df_plot, aes(x=Data, y=Preco, color=Cenario)) +
  geom_line(size=1) +
  theme_minimal() +
  scale_color_manual(values=c("red", "green", "blue")) +
  labs(title="Sensibilidade a Cenários Geopolíticos", y="Preço Projetado")

ggsave("output/grafico_comparativo_cenarios.png", p, width=10, height=6)
cat("Gráfico 39 gerado.\n")
