#!/bin/bash

# Script para inicializar todo el proyecto desde cero
echo "🚀 Inicialización completa del proyecto..."

# 1. Instalar dependencias
./scripts/build-all.sh

# 2. Generar Prisma
./scripts/prisma-generate-all.sh

# 3. Copiar envs si no existen
echo "📝 Configurando archivos .env..."
if [ ! -f ".env" ]; then
    cp env.example .env
    echo "✅ .env principal creado"
fi

services=("ecommerce-api-gateway" "ecommerce-users-service" "ecommerce-products-service" "ecommerce-notifications-service" "ecommerce-shopping-cart-service" "ecommerce-orders-service" "ecommerce-payments-service")

for service in "${services[@]}"; do
    if [ ! -f "$service/.env" ]; then
        cp "$service/.env.example" "$service/.env"
        echo "✅ .env para $service creado"
    fi
done

echo "🎉 Proyecto inicializado! Usa 'make up' para comenzar."
