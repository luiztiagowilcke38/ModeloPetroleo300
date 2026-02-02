# mod36_exportar_resultados.R
# Autor: Luiz Tiago Wilcke
# Descrição: Exportação de resultados para CSV/Excel

cat("Exportando resultados...\n")

df_final <- readRDS("output/projecao_final_consolidada.rds")

write.csv(df_final, "output/RESULTADO_FINAL_PETROLEO_2026_2040.csv", row.names = FALSE)

# Tentar exportar excel se pacote disponivel, senao apenas CSV
if(require("writexl")){
  writexl::write_xlsx(df_final, "output/RESULTADO_FINAL_PETROLEO_2026_2040.xlsx")
} else {
  cat("Pacote writexl não encontrado, exportando apenas CSV.\n")
}

cat("Resultados exportados com sucesso.\n")
