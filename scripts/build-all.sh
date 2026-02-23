#!/bin/bash

# Script para construir todos los microservicios

echo "🔨 Construyendo todos los microservicios..."

services=("api-gateway" "user-service" "product-service" "notification-service")

for service in "${services[@]}"; do
    echo "📦 Construyendo $service..."
    
    cd "microservices/$service"
    
    if [ -f "package.json" ]; then
        pnpm install
        pnpm run build
        echo "✅ $service construido exitosamente"
    else
        echo "❌ No se encontró package.json en $service"
    fi
    
    cd "../.."
done

echo "🎉 Construcción completada para todos los servicios!"
