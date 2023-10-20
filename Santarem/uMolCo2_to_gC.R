library(readr)
library(bigleaf)

# Carregue o DataFrame
df_data <- read_csv('./ameriflux_resampled.csv')

# Crie um DataFrame vazio com as mesmas colunas que df_data
df_que_armazena <- data.frame(matrix(nrow = nrow(df_data), ncol = ncol(df_data)))

# Defina os nomes das colunas do DataFrame vazio para que correspondam a df_data
colnames(df_que_armazena) <- colnames(df_data)

# Itere pelas colunas do DataFrame
for (coluna in colnames(df_data)) {
  # Aplique a função umolCO2.to.gC à coluna atual
  temp_result <- umolCO2.to.gC(CO2_flux = df_data[[coluna]])
  
  # Adicione a coluna de resultados ao DataFrame
  df_que_armazena[[coluna]] <- temp_result
}

# Especifique o caminho onde deseja salvar o arquivo CSV
caminho_do_arquivo <- './resultado_variaveis.csv'

# Use a função write.csv para salvar o DataFrame em um arquivo CSV
write.csv(df_que_armazena, file = caminho_do_arquivo, row.names = FALSE)
