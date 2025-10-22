# Context-Coder Frontend - Makefile

.PHONY: help install dev build preview clean docker-build docker-up docker-down lint

help: ## Mostrar esta mensagem de ajuda
	@echo "Context-Coder Frontend - Comandos Disponíveis"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Instalar dependências
	@echo "📦 Instalando dependências do frontend..."
	cd frontend && npm install
	@echo "✅ Dependências instaladas!"

dev: ## Iniciar servidor de desenvolvimento
	@echo "🚀 Iniciando servidor de desenvolvimento..."
	cd frontend && npm run dev

build: ## Build para produção
	@echo "🏗️  Fazendo build para produção..."
	cd frontend && npm run build
	@echo "✅ Build concluído! Arquivos em frontend/dist/"

preview: ## Preview do build de produção
	@echo "👀 Iniciando preview do build..."
	cd frontend && npm run preview

lint: ## Executar linter
	@echo "🔍 Executando linter..."
	cd frontend && npm run lint

docker-build: ## Build da imagem Docker
	@echo "🐋 Fazendo build da imagem Docker..."
	docker-compose build

docker-up: ## Iniciar com Docker Compose
	@echo "🐋 Iniciando containers..."
	docker-compose up

docker-up-d: ## Iniciar com Docker Compose (background)
	@echo "🐋 Iniciando containers em background..."
	docker-compose up -d

docker-down: ## Parar containers Docker
	@echo "🛑 Parando containers..."
	docker-compose down

docker-logs: ## Ver logs dos containers
	docker-compose logs -f

clean: ## Limpar node_modules e cache
	@echo "🧹 Limpando arquivos..."
	rm -rf frontend/node_modules
	rm -rf frontend/dist
	rm -rf frontend/.vite
	@echo "✅ Limpeza concluída!"

clean-docker: ## Limpar containers e volumes Docker
	@echo "🧹 Limpando Docker..."
	docker-compose down -v
	docker system prune -f
	@echo "✅ Docker limpo!"

shell: ## Abrir shell no container
	docker-compose exec frontend /bin/sh
