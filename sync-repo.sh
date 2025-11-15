#!/bin/bash

# Script para sincronizar el repositorio con el remoto original
# Uso: ./sync-repo.sh o ponerlo en un cron job

cd "$(dirname "$0")"

echo "🔄 Sincronizando repositorio..."

# Traer cambios del remoto
git fetch origin

# Verificar si hay cambios nuevos
if git diff --quiet origin/main..HEAD; then
    echo "✅ Tu repositorio ya está actualizado"
else
    echo "📥 Hay cambios nuevos. Actualizando..."
    git merge origin/main
    echo "✅ Repositorio actualizado correctamente"
fi

# Mostrar el estado
git status
