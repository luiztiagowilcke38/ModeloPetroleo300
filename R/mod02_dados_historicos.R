# mod02_dados_historicos.R
# Autor: Luiz Tiago Wilcke
# Descrição: Geração/Importação de dados simulados realistas do preço do petróleo (Brent)
# Nota: Simulando dados históricos (1980-2025) para garantir execução sem dependência de API externa instável neste ambiente.

cat("Gerando dados históricos simulados...\n")

cat("Tentando obter dados reais via Yahoo Finance (Brent Crude)...\n")

df_historico <- tryCatch({
  # Tenta buscar Brent (BZ=F) ou WTI (CL=F)
  # Usando auto.assign=FALSE para retornar o objeto direto
  brent_xts <- quantmod::getSymbols("BZ=F", src="yahoo", from="1980-01-01", to="2025-12-31", auto.assign=FALSE)
  
  # AGREGAR PARA MENSAL (Média do mês)
  brent_monthly <- apply.monthly(brent_xts, mean)
  
  # Converter para Dataframe
  df_real <- data.frame(
    Data = zoo::index(brent_monthly),
    Preco_Brent = as.numeric(brent_monthly[, "BZ=F.Adjusted"])
  )
  
  # Limpar NAs iniciais
  df_real <- na.omit(df_real)
  
  cat("Dados REAIS obtidos e agregados (MENSAL) com sucesso! Registros:", nrow(df_real), "\n")
  df_real

}, error = function(e){
  cat("ALERTA: Falha ao obter dados reais online (Erro: ", e$message, ").\n")
  cat("Utilizando dados simulados de backup para garantir execução...\n")
  
  # Fallback: Simulação
  set.seed(123)
  datas <- seq(as.Date("1980-01-01"), as.Date("2025-12-31"), by="month")
  n <- length(datas)
  tendencia <- seq(20, 90, length.out = n)
  ciclo1 <- 30 * sin(seq(0, 10*pi, length.out = n))
  ciclo2 <- 15 * cos(seq(0, 5*pi, length.out = n))
  ruido <- rnorm(n, mean=0, sd=5)
  preco <- pmax(tendencia + ciclo1 + ciclo2 + ruido, 10)
  
  data.frame(Data = datas, Preco_Brent = preco)
})

write.csv(df_historico, "data/dados_historicos_petroleo.csv", row.names = FALSE)
cat("Dados históricos prontos e salvos.\n")
