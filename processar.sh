#!/bin/bash
set -euo pipefail

# processar.sh
# Uso: bash processar.sh <arquivo>

ARQUIVO="$1"
EXTENSAO="${ARQUIVO##*.}"

case "$EXTENSAO" in
  log)
    echo "Arquivo de log detectado. Buscando erros..."
    grep -i "erro" "$ARQUIVO" || echo "Nenhum erro encontrado."
    ;;
  
  txt)
    echo "Arquivo de texto detectado. Exibindo conteúdo..."
    cat "$ARQUIVO"
    ;;
  
  sh)
    echo "Script shell detectado. Verificando shebang..."
    head -n 1 "$ARQUIVO"
    ;;
  
  csv)
    echo "Arquivo CSV detectado. Contando linhas..."
    wc -l "$ARQUIVO"
    ;;

  conf)
    echo "Arquivo de configuração detectado. Mostrando linhas ativas..."
    grep -v "^#" "$ARQUIVO"
    ;;

  *)
    echo "Extensão '$EXTENSAO' não reconhecida." >&2
    exit 1
    ;;
esac
