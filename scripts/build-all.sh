#!/bin/bash

# Script para construir todos los microservicios

echo "🔨 Construyendo todos los microservicios..."

services=("ecommerce-api-gateway" "ecommerce-users-service" "ecommerce-products-service" "ecommerce-notifications-service")

for service in "${services[@]}"; do
    echo "📦 Construyendo $service..."
    
    cd "$service"
    
    if [ -f "package.json" ]; then
        pnpm install
        echo "✅ $service construido exitosamente"
    else
        echo "❌ No se encontró package.json en $service"
    fi
    
    cd ..
done

echo "🎉 Construcción completada para todos los servicios!"
