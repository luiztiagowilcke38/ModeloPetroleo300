# mod08_consolidacao_base.R
# Autor: Luiz Tiago Wilcke
# Descrição: Unificação de todos os datasets em um Master Dataframe

cat("Consolidando base de dados mestra...\n")

library(dplyr)
library(readr)

# Ler todos os CSVs gerados
d1 <- read_csv("data/dados_historicos_petroleo.csv", show_col_types = FALSE)
d2 <- read_csv("data/dados_geopoliticos.csv", show_col_types = FALSE)
d3 <- read_csv("data/dados_macro.csv", show_col_types = FALSE)
d4 <- read_csv("data/dados_oferta_demanda.csv", show_col_types = FALSE)
d5 <- read_csv("data/dados_transicao_energetica.csv", show_col_types = FALSE)

# Merge
df_final <- d1 %>%
  left_join(d2, by="Data") %>%
  left_join(d3, by="Data") %>%
  left_join(d4, by="Data") %>%
  left_join(d5, by="Data")

# Salvar
saveRDS(df_final, "data/base_consolidada.rds")
write.csv(df_final, "data/base_consolidada.csv", row.names = FALSE)

cat("Base consolidada criada com sucesso! Dimensões:", dim(df_final), "\n")
