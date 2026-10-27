# ============================================================================
# PUBLICAR - empurra o index.html para o GitHub e atualiza o site publicado
#
# Uso:  ./publicar.sh
#
# O que este script faz:
#   1. Confere se ha alteracoes locais
#   2. Faz commit com a mensagem que voce digitar
#   3. Envia para a branch main
#   4. Espera o GitHub Pages reconstruir
#   5. Confere que o site publicado responde com a versao nova
#
# O site fica no ar em: https://thayaneteixeiraugc.github.io/thayane.ugc/
# ============================================================================

set -e

GIT="/c/Users/Thayane Cardoso/AppData/Local/Programs/Git/cmd/git.exe"
GH="/c/Program Files/GitHub CLI/gh.exe"
DIR="C:/Users/Thayane Cardoso/Desktop/Teste KPA"
SITE="https://thayaneteixeiraugc.github.io/thayane.ugc/"

cd "$DIR"

echo "=============================================="
echo " PUBLICAR NO GITHUB PAGES"
echo "=============================================="

# --- 1. ha alteracoes? ---
if [ -z "$(git status --porcelain)" ]; then
  echo ""
  echo "Nenhuma alteracao local para publicar."
  echo "O site ja esta em dia com o ultimo commit."
  exit 0
fi

echo ""
echo "Alteracoes detectadas:"
git status --short
echo ""

# --- 2. pedir a mensagem do commit ---
if [ -n "$1" ]; then
  MSG="$1"
else
  echo "Digite a mensagem do commit (curta, describe a mudanca):"
  read -r MSG
fi

if [ -z "$MSG" ]; then
  echo "Mensagem vazia. Publicacao cancelada."
  exit 1
fi

# --- 3. commit ---
git add -A
git commit -m "$MSG"

# --- 4. push ---
echo ""
echo "Enviando para o GitHub..."
git push origin main

COMMIT=$(git rev-parse HEAD)
CURTO=${COMMIT:0:7}
echo "Commit $CURTO enviado."

# --- 5. esperar o Pages reconstruir ---
echo ""
echo "Aguardando o GitHub Pages reconstruir..."
ESPERA=0
while [ $ESPERA -lt 180 ]; do
  sleep 10
  ESPERA=$((ESPERA+10))
  STATUS=$(gh api "repos/thayaneteixeiraugc/thayane.ugc/pages/builds/latest" 2>/dev/null \
    | sed -n 's/.*"status":"\([^"]*\)".*/\1/p' | head -1)
  BUILD_COMMIT=$(gh api "repos/thayaneteixeiraugc/thayane.ugc/pages/builds/latest" 2>/dev/null \
    | sed -n 's/.*"commit":"\([^"]*\)".*/\1/p' | head -1)

  if [ "$STATUS" != "building" ] && [ "$BUILD_COMMIT" = "$COMMIT" ]; then
    break
  fi
done

echo "Build: $STATUS (commit ${BUILD_COMMIT:0:7})"

if [ "$STATUS" != "built" ]; then
  echo ""
  echo "O build nao terminou com sucesso. Veja o log em:"
  echo "  https://github.com/thayaneteixeiraugc/thayane.ugc/settings/pages"
  exit 1
fi

# --- 6. conferir o site publicado ---
HTTP=$(curl -s -o /dev/null -w "%{http_code}" "$SITE")

echo ""
echo "=============================================="
echo " SITE PUBLICADO"
echo "=============================================="
echo "URL:    $SITE"
echo "HTTP:   $HTTP"
echo "Commit: $CURTO"
echo ""
echo "Leva alguns segundos para aparecer em cache."
