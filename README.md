# Projeto de Previsão do Preço do Petróleo (2026-2040)

**Autor:** Luiz Tiago Wilcke  
**Data:** 02 de Fevereiro de 2026

## Descrição
Este projeto utiliza técnicas avançadas de ciência de dados e modelagem estocástica para prever o comportamento do preço do barril de petróleo (Brent) para o horizonte de 2026 a 2040.

O sistema é composto por **40 módulos em R**, integrando:
- **Séries Temporais:** ARIMA, ETS, GARCH, Prophet, NNAR.
- **Modelos Lineares:** Regressão Múltipla, Regressão Robusta, VAR.
- **Equações Estocásticas:** Movimento Browniano Geométrico (GBM), Ornstein-Uhlenbeck, Jump Diffusion.
- **Variáveis Geopolíticas:** Índice de Risco Geopolítico (GPR) e cenários de conflito.

## Funcionalidades
- Simulação de 10.000 caminhos de preços futuros via Monte Carlo.
- Análise de sensibilidade a crises globais.
- Intervalos de confiança de 95% para longo prazo.
- Visualizações ricas (Fan Charts, Densidade, Mapas de Calor, Comparativo de Cenários).

## Estrutura do Projeto
- `R/`: Código fonte dos 40 módulos.
- `data/`: Bases de dados históricas e simuladas.
- `output/`: Resultados gerados (csv, rds) e gráficos (png).

## Como Executar
1. Certifique-se de ter o R instalado.
2. Abra o projeto no RStudio ou terminal.
3. Execute o script principal:
   ```R
   source("main.R")
   ```

## Variáveis Utilizadas
- **Preco_Brent:** Preço histórico do barril (USD)
- **Indice_GPR:** Índice de Risco Geopolítico
- **Producao_Global:** Oferta mundial (milhões barris/dia)
- **Demanda_Global:** Consumo mundial
- **Indice_Renovaveis:** Fator de impacto da transição energética

---
*Desenvolvido por Luiz Tiago Wilcke*
