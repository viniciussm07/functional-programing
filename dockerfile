# Utiliza uma imagem oficial do Haskell, neste caso a tag 9.10.1-bullseye.
FROM haskell:9.10.1-bullseye

# Define o diretório de trabalho dentro do container.
WORKDIR /app

# Copia os arquivos do projeto (caso você tenha um código Haskell para compilar ou testar).
# Se você apenas deseja usar o GHCi interativo, esta etapa é opcional.
# COPY . /app

# Comando padrão: inicia o GHCi (interpretador interativo do GHC).
CMD ["ghci"]
