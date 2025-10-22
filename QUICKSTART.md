# Context-Coder Frontend - Quick Start 🚀

## Início Rápido (3 opções)

### 🏃 Opção 1: Desenvolvimento Local (Mais Rápido)

```bash
# 1. Entre na pasta frontend
cd frontend

# 2. Instale dependências
npm install

# 3. Configure ambiente
echo "VITE_API_URL=http://localhost:8000" > .env

# 4. Inicie
npm run dev

# ✅ Acesse: http://localhost:5173
```

---

### 🐋 Opção 2: Docker Compose (Mais Simples)

```bash
# 1. Configure ambiente (se necessário)
cp .env.example .env

# 2. Inicie
docker-compose up --build

# ✅ Acesse: http://localhost:5173
```

---

### 🛠️ Opção 3: Usando Makefile (Mais Elegante)

```bash
# Primeira vez
make install

# Desenvolvimento local
make dev

# Ou com Docker
make docker-up

# ✅ Acesse: http://localhost:5173
```

---

## 📋 Pré-requisitos

### Para desenvolvimento local:
- Node.js 18+ e npm
- Backend rodando em `http://localhost:8000`

### Para Docker:
- Docker e Docker Compose instalados
- Backend rodando (ou ajuste `VITE_API_URL`)

---

## 🔧 Comandos Úteis

### Desenvolvimento

```bash
# Instalar dependências
npm install

# Dev server (hot-reload)
npm run dev

# Build para produção
npm run build

# Preview do build
npm run preview

# Lint
npm run lint
```

### Docker

```bash
# Build
docker-compose build

# Iniciar
docker-compose up

# Background
docker-compose up -d

# Logs
docker-compose logs -f

# Parar
docker-compose down

# Limpar tudo
docker-compose down -v
```

### Makefile (Atalhos)

```bash
make help          # Ver todos os comandos
make install       # Instalar deps
make dev           # Dev local
make build         # Build prod
make docker-up     # Docker
make docker-down   # Parar Docker
make clean         # Limpar cache
make lint          # Linter
```

---

## 🌐 Configuração de Ambiente

### Arquivo `.env` no diretório `frontend/`:

```bash
# URL do backend
VITE_API_URL=http://localhost:8000

# Para produção, use a URL real:
# VITE_API_URL=https://api.your-domain.com
```

**⚠️ Importante:** Variáveis devem começar com `VITE_` para serem expostas.

---

## 🚀 Estrutura de Páginas

1. **Home** (`/`) - Tela inicial
2. **Session** (`/session`) - Interface de chat com IA
3. **Review** (`/review`) - Revisão de especificações

---

## 🔌 Integração com Backend

O frontend espera que o backend esteja rodando com:

- **Base URL**: `http://localhost:8000` (padrão)
- **CORS habilitado** para `http://localhost:5173`
- **Endpoints esperados:**
  - `POST /api/agent/invoke` - Enviar mensagem
  - `POST /api/agent/stream` - Chat com streaming
  - `GET /api/repositories` - Listar repositórios
  - `POST /api/export/markdown` - Exportar spec

---

## 🐛 Troubleshooting

### ❌ "Cannot connect to backend"

**Causa:** Backend não está rodando ou URL errada

**Solução:**
```bash
# Verifique se backend está up
curl http://localhost:8000/docs

# Confirme .env
cat frontend/.env
# Deve ter: VITE_API_URL=http://localhost:8000
```

---

### ❌ CORS Error

**Causa:** Backend não permite origem do frontend

**Solução:**  
No backend, configure:
```bash
CORS_ORIGINS=http://localhost:5173
```

---

### ❌ Módulos não encontrados

**Causa:** node_modules não instalados

**Solução:**
```bash
cd frontend
rm -rf node_modules package-lock.json
npm install
```

---

### ❌ Porta 5173 já em uso

**Causa:** Outro processo usando a porta

**Solução:**
```bash
# Matar processo na porta
lsof -ti:5173 | xargs kill -9

# Ou usar outra porta
npm run dev -- --port 3000
```

---

## 📦 Build e Deploy

### Build Local

```bash
cd frontend
npm run build

# Arquivos em: dist/
# Servir com: npm run preview
```

### Deploy Estático

Os arquivos em `dist/` podem ser deployados em:

- **Vercel**: `vercel deploy`
- **Netlify**: Drag & drop da pasta `dist/`
- **GitHub Pages**: Via GitHub Actions
- **AWS S3**: `aws s3 sync dist/ s3://bucket-name`
- **Nginx**: Copiar `dist/` para `/var/www/html`

### Variáveis em Produção

Configure `VITE_API_URL` para a URL do backend em produção:

```bash
# Build com variável customizada
VITE_API_URL=https://api.production.com npm run build
```

---

## 🎯 Próximos Passos

1. ✅ Frontend rodando
2. 🔌 Conectar ao backend
3. 🧪 Testar fluxo completo
4. 🎨 Personalizar temas (opcional)
5. 🚀 Deploy em produção

---

## 📚 Recursos

- [Documentação React](https://react.dev)
- [Guia Vite](https://vitejs.dev/guide/)
- [shadcn/ui Components](https://ui.shadcn.com/)
- [Tailwind CSS](https://tailwindcss.com/docs)

---

**🎉 Pronto para codar!**
