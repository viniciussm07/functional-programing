# Variáveis
GHC = ghc
SRC = atividade3.hs
BIN_DIR = binaries
TARGET = $(BIN_DIR)/atividade3
FLAGS = -Wall -O2

# Alvo principal
all: $(TARGET)

# Cria a pasta binaries se não existir e compila o programa
$(TARGET): $(SRC)
	mkdir -p $(BIN_DIR)
	$(GHC) $(FLAGS) -outputdir=$(BIN_DIR) -o $(TARGET) $(SRC)

# Remove arquivos gerados
clean:
	rm -rf $(BIN_DIR)

# Executa o programa
run: $(TARGET)
	./$(TARGET)

# Define alvos que não são arquivos
.PHONY: all clean run