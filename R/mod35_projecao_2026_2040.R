# mod35_projecao_2026_2040.R
# Autor: Luiz Tiago Wilcke
# Descrição: Consolidação da Projeção Final (Data + Valores)

cat("Gerando projeção final 2026-2040...\n")

df_ic <- readRDS("output/intervalos_confianca.rds")
cenarios <- readRDS("data/cenarios_futuros_gpr.rds")

df_final_proj <- data.frame(
  Data = cenarios$Data,
  Preco_Previsto = df_ic$Media,
  IC_Inferior = df_ic$Lower,
  IC_Superior = df_ic$Upper
)

saveRDS(df_final_proj, "output/projecao_final_consolidada.rds")
cat("Projeção final consolidada.\n")
