# MAIN SCRIPT (Orquestrador)
# Projeto: Previsão Preço Petróleo 2026-2040
# Autor: Luiz Tiago Wilcke

# Lista de todos os arquivos na pasta R
scripts <- list.files("R", pattern="\\.R$", full.names=TRUE)

# Ordenar para garantir execução sequencial (mod01... mod40)
scripts <- sort(scripts)

cat("Iniciando execução de", length(scripts), "módulos...\n\n")

for(s in scripts){
  cat("---------------------------------------------------\n")
  cat("Executando:", basename(s), "...\n")
  source(s)
  cat("OK.\n")
}

cat("\n---------------------------------------------------\n")
cat("PROJETO CONCLUÍDO COM SUCESSO!\n")
cat("Verifique a pasta 'output/' para resultados e gráficos.\n")
