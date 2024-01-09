#!/bin/bash

# Diretório onde os CSVs estão localizados
diretorio_csvs=~/Documents/Python/main/csvs/L1C_links

# Diretório de destino local
diretorio_base_destino=~/Documents/Python/main/Imagem/

# Itera sobre cada CSV no diretório
for csv in $diretorio_csvs/*.csv; do
    # Obtém o nome do CSV (sem a extensão)
    nome_csv=$(basename "$csv" .csv)

    # Cria um diretório para o resultado dentro do diretório base
    diretorio_destino="$diretorio_base_destino/$nome_csv"
    mkdir -p "$diretorio_destino"

    # Lê cada linha do CSV
    while IFS= read -r linha; do
        # Exclui o diretório se ele terminar com "_$folder$"
        if [[ $linha != *"_\$folder$"* ]]; then
            # Imprime o comando, mas não executa
            echo $linha
            gsutil -m cp -r "$linha*" "$diretorio_destino"
        fi
    done < "$csv"

    # Aguarda a entrada do usuário para prosseguir para o próximo CSV
    read -p "Pressione Enter para prosseguir para o próximo CSV..."
done

