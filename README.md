# Projeto de Previsão do Preço do Petróleo (2026-2040)

**Autor:** Luiz Tiago Wilcke  

## Descrição
Este projeto utiliza técnicas avançadas de ciência de dados e modelagem estocástica para prever o comportamento do preço do barril de petróleo (Brent) para o horizonte de 2026 a 2040. O sistema integra dados reais, séries temporais, modelos lineares e equações diferenciais estocásticas.

## Modelagem Matemática

O modelo baseia-se em um ensemble de 40 módulos, com destaque para as seguintes equações fundamentais:

### 1. Movimento Browniano Geométrico (GBM)
Utilizado para simular a trajetória estocástica principal dos preços:

$$
dS_t = \mu S_t dt + \sigma S_t dW_t
$$

Onde $S_t$ é o preço, $\mu$ o drift (tendência), $\sigma$ a volatilidade e $dW_t$ um processo de Wiener.

### 2. Processo de Reversão à Média (Ornstein-Uhlenbeck)
Modela a tendência econômica de retorno ao custo marginal de produção no longo prazo:

$$
dX_t = \theta (\mu - X_t) dt + \sigma dW_t
$$

Onde $\theta$ representa a velocidade de reversão à média $\mu$.

### 3. Jump Diffusion (Merton)
Incorpora choques geopolíticos súbitos (guerras, sanções) através de um processo de Poisson:

$$
\frac{dS_t}{S_{t-}} = (\mu - \lambda k) dt + \sigma dW_t + (Y - 1) dN_t
$$

Onde $dN_t$ é o processo de contagem de saltos e $Y$ a magnitude log-normal do salto.

### 4. Volatilidade Condicional (GARCH 1,1)
Captura os aglomerados de volatilidade (volatility clustering) observados no mercado financeiro:

$$
\sigma_t^2 = \omega + \alpha \epsilon_{t-1}^2 + \beta \sigma_{t-1}^2
$$

### 5. Regressão com Variáveis Exógenas
O componente determinístico considera variáveis macroeconômicas e geopolíticas:

$$
Y_t = \beta_0 + \beta_1 \text{Prod}_t + \beta_2 \text{Demanda}_t + \beta_3 \text{DXY}_t + \beta_4 \text{GPR}_t + \epsilon_t
$$

## Estrutura do Projeto (40 Módulos)
- **Coleta de Dados:** Integração automática com Yahoo Finance (Brent Crude).
- **Processamento:** Limpeza, agregação mensal e cálculo de retornos.
- **Modelagem:** ARIMA, ETS, Prophet, NNAR, VAR, SDEs.
- **Simulação:** Monte Carlo (10.000 cenários) para intervalos de confiança.
- **Visualização:** Fan Charts e Mapas de Densidade.

## Como Executar
1. Clone o repositório:
   ```bash
   git clone https://github.com/luiztiagowilcke38/ModeloPetroleo300.git
   ```
2. Abra o projeto no RStudio ou terminal.
3. Execute o script principal:
   ```R
   source("main.R")
   ```

## Variáveis Principais
- **Preco_Brent:** Preço histórico do barril (USD) - Fonte: Yahoo Finance
- **Indice_GPR:** Índice de Risco Geopolítico (Simulado/Calibrado)
- **Producao_Global:** Oferta mundial (milhões barris/dia)
- **Demanda_Global:** Consumo mundial
- **Indice_Renovaveis:** Fator de impacto da transição energética

---
*Desenvolvido por Luiz Tiago Wilcke*
