# Makefile para la gestión de microservicios - E-commerce Platform

DOCKER_COMPOSE = docker compose

.PHONY: help install up down test test-quick logs ps

help: ## Muestra este mensaje de ayuda
	@echo "Uso: make [comando]"
	@echo ""
	@echo "Comandos disponibles:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Instala dependencias en todos los microservicios (scripts/build-all.sh)
	./scripts/build-all.sh

up: ## Inicia todos los servicios en modo desarrollo (scripts/start-dev.sh)
	./scripts/start-dev.sh

down: ## Detiene todos los servicios (scripts/stop-dev.sh)
	./scripts/stop-dev.sh

test: ## Ejecuta el conjunto completo de pruebas automatizadas (scripts/test-all.sh)
	./scripts/test-all.sh

test-quick: ## Ejecuta una verificación rápida de salud del sistema (scripts/quick-test.sh)
	./scripts/quick-test.sh

logs: ## Muestra los logs de todos los servicios en tiempo real
	$(DOCKER_COMPOSE) logs -f

ps: ## Muestra el estado de los contenedores de los microservicios
	$(DOCKER_COMPOSE) ps
