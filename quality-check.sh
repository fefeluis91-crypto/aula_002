#!/bin/bash

# Cores para o terminal ficar bonito
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

echo -e "${GREEN}=== Iniciando Análise de Qualidade ===${NC}"

# 1. Roda o Linter (Golangci-lint)
echo "1. Rodando Linter..."
golangci-lint run
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Falha no Linter. Corrija os erros acima.${NC}"
    exit 1
fi

# 2. Roda os Testes e Gera Cobertura
echo "2. Rodando Testes e calculando cobertura..."
# O comando abaixo roda os testes e salva o resultado em coverage.out
# O segredo está no -coverpkg=./...
go test -v -coverpkg=./... -coverprofile=coverage.out ./...

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Os testes falharam.${NC}"
    exit 1
fi

# 3. Verifica a porcentagem de cobertura
# Extrai o número da cobertura total
COVERAGE=$(go tool cover -func=coverage.out | grep total | awk '{print $3}' | sed 's/%//')

# Define sua meta (ex: 80%)
THRESHOLD=40

echo -e "${GREEN}Cobertura atual: $COVERAGE% (Meta: $THRESHOLD%)${NC}"

# Compara usando o comando 'bc' para lidar com decimais
if (( $(echo "$COVERAGE < $THRESHOLD" | bc -l) )); then
    echo -e "${RED}❌ Erro: Cobertura abaixo do limite de $THRESHOLD%${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Tudo perfeito! Código aprovado.${NC}"
# ... (abaixo da parte que verifica o THRESHOLD) ...

echo "Gerando relatório visual de cobertura..."
go tool cover -html=coverage.out -o coverage.html

echo -e "${GREEN}✅ Relatório gerado: coverage.html${NC}"
exit 0