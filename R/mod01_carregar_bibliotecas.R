# mod01_carregar_bibliotecas.R
# Autor: Luiz Tiago Wilcke
# Descrição: Carregamento de pacotes necessários para o projeto

cat("Carregando bibliotecas...\n")

if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  forecast,       # Modelos de Séries Temporais (ARIMA, ETS)
  tseries,        # Testes de raiz unitária (ADF, KPSS)
  ggplot2,        # Visualização de dados
  quantmod,       # Dados financeiros
  readr,          # Leitura de dados
  dplyr,          # Manipulação de dados
  tidyr,          # Organização de dados
  stochvol,       # Volatilidade Estocástica
  sde,            # Equações Diferenciais Estocásticas
  MASS,           # Funções estatísticas
  prophet,        # Modelo Prophet do Facebook
  neuralnet,      # Redes Neurais
  caret,          # Machine Learning
  vars,           # Modelos VAR
  strucchange     # Testes de quebra estrutural
)

cat("Bibliotecas carregadas com sucesso!\n")
