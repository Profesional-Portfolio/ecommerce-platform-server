#!/bin/bash

# Script para iniciar todos los servicios en modo desarrollo

echo "🚀 Iniciando microservicios en modo desarrollo..."

# Verificar si Docker está corriendo
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker no está corriendo. Por favor, inicia Docker primero."
    exit 1
fi

# Crear red si no existe                                                                              
docker network create microservices-network 2>/dev/null || true

echo "📦 Iniciando bases de datos..."
docker compose up -d postgres mongodb redis

echo "⏳ Esperando que las bases de datos estén listas..."
sleep 10

echo "🔧 Iniciando microservicios..."
docker compose up -d api-gateway user-service product-service notification-service

echo "✅ Todos los servicios están iniciados!"
echo ""
echo "📋 Servicios disponibles:"
echo "  🌐 API Gateway:          http://localhost:3000"
echo "  👤 User Service:         http://localhost:3001"
echo "  📦 Product Service:      http://localhost:3002"
echo "  🔔 Notification Service: http://localhost:3003"
echo ""
echo "📊 Bases de datos:"
echo "  🐘 PostgreSQL:  localhost:5432 (user: postgres, pass: postgres123)"
echo "  🍃 MongoDB:     localhost:27017 (user: mongo, pass: mongo123)"
echo "  🔴 Redis:       localhost:6379 (pass: redis123)"
echo ""
echo "📝 Para ver logs: docker-compose logs -f [servicio]"
echo "🛑 Para detener: ./scripts/stop-dev.sh"
