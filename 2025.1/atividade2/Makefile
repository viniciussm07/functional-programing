# Variáveis
GHC = ghc
SRC = atividade2.hs
BIN_DIR = binaries
TARGET = $(BIN_DIR)/atividade2
FLAGS = -Wall -O2

# Alvo principal
all: $(TARGET)

# Cria a pasta binaries se não existir e compila o programa
$(TARGET): $(SRC)
	mkdir -p $(BIN_DIR)
	$(GHC) $(FLAGS) -o $(TARGET) $(SRC)

# Remove arquivos gerados
clean:
	rm -rf $(BIN_DIR)
	rm -f *.o *.hi

# Executa o programa
run: $(TARGET)
	./$(TARGET)

# Define alvos que não são arquivos
.PHONY: all clean run