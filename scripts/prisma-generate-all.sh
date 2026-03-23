#!/bin/bash

# Script para generar clientes Prisma en todos los servicios que lo usen
echo "💎 Generando clientes Prisma..."

services=("ecommerce-users-service" "ecommerce-orders-service")

for service in "${services[@]}"; do
    echo "🏗️ Generando Prisma para $service..."
    cd "$service"
    if [ -f "package.json" ]; then
        npx prisma generate
        echo "✅ Prisma generado en $service"
    else
        echo "❌ No se encontró $service"
    fi
    cd ..
done

echo "🎉 Generación de Prisma completada!"
