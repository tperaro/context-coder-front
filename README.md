# Context-Coder Frontend

Interface web moderna para o Context-Coder - Plataforma AI-powered que transforma contexto de repositórios em tasks acionáveis.

## 🚀 Stack Tecnológica

- **React 18** - Biblioteca UI
- **TypeScript** - Type safety
- **Vite** - Build tool & dev server rápido
- **shadcn/ui** - Componentes UI (Radix UI + Tailwind CSS)
- **Zustand** - State management
- **React Router** - Navegação
- **Lucide React** - Ícones
- **React Markdown** - Renderização de markdown
- **Mermaid** - Diagramas

## ⚡ Quick Start

### Pré-requisitos

- Node.js 18+ e npm
- Backend do Context-Coder rodando em `http://localhost:8000`

### Opção 1: Desenvolvimento Local (Recomendado)

```bash
# 1. Clone o repositório
git clone <repo-url>
cd context-coder-front/frontend

# 2. Instale as dependências
npm install

# 3. Configure o ambiente
echo "VITE_API_URL=http://localhost:8000" > .env

# 4. Inicie o servidor de desenvolvimento
npm run dev

# Acesse: http://localhost:5173
```

### Opção 2: Docker

```bash
# 1. Configure o ambiente
cp .env.example .env
# Edite .env se necessário

# 2. Inicie com Docker Compose
docker-compose up --build

# Acesse: http://localhost:5173
```

## 📁 Estrutura do Projeto

```
frontend/
├── src/
│   ├── components/          # Componentes React
│   │   ├── ui/             # Componentes shadcn/ui
│   │   ├── chat/           # Interface de chat
│   │   │   ├── ChatInterface.tsx
│   │   │   ├── ActionButtons.tsx
│   │   │   └── VoiceInput.tsx
│   │   └── sidebar/        # Sidebar com seletores
│   │       ├── ProfileSelector.tsx
│   │       └── RepositorySelector.tsx
│   ├── pages/              # Páginas da aplicação
│   │   ├── Home.tsx        # Tela inicial
│   │   ├── Session.tsx     # Sessão de chat
│   │   └── Review.tsx      # Review de specs
│   ├── stores/             # Estado global (Zustand)
│   │   └── session.ts
│   ├── api/                # Cliente API
│   │   └── client.ts
│   ├── lib/                # Utilitários
│   │   └── utils.ts
│   ├── App.tsx             # Componente raiz
│   ├── main.tsx            # Entry point
│   └── index.css           # Estilos globais
├── public/                 # Assets estáticos
├── index.html              # HTML template
├── package.json            # Dependências
├── vite.config.ts          # Configuração Vite
├── tailwind.config.js      # Configuração Tailwind
├── tsconfig.json           # Configuração TypeScript
└── Dockerfile              # Docker image
```

## 🔧 Scripts Disponíveis

```bash
# Desenvolvimento (hot-reload)
npm run dev

# Build para produção
npm run build

# Preview do build
npm run preview

# Lint do código
npm run lint
```

## 🌐 Variáveis de Ambiente

Crie um arquivo `.env` na raiz do diretório `frontend/`:

```bash
# URL do backend API
VITE_API_URL=http://localhost:8000
```

**Nota:** Variáveis devem começar com `VITE_` para serem expostas no cliente.

## 🎨 Personalização

### Temas e Cores

O projeto usa Tailwind CSS com tema customizado. Edite `tailwind.config.js` para ajustar:

```js
theme: {
  extend: {
    colors: {
      // Suas cores aqui
    }
  }
}
```

### Componentes UI

Componentes shadcn/ui estão em `src/components/ui/`. São componentes headless do Radix UI estilizados com Tailwind.

## 🔌 Integração com Backend

O frontend se comunica com o backend através de:

- **REST API**: Endpoints em `http://localhost:8000/api/`
- **Streaming**: SSE (Server-Sent Events) para respostas de chat

Veja `src/api/client.ts` para detalhes da integração.

## 📦 Build e Deploy

### Build Local

```bash
npm run build
# Arquivos gerados em: dist/
```

### Docker Production

```bash
docker build -t context-coder-frontend .
docker run -p 5173:5173 \
  -e VITE_API_URL=http://seu-backend:8000 \
  context-coder-frontend
```

### Deploy Estático

O build gera arquivos estáticos que podem ser servidos por:
- Vercel
- Netlify
- AWS S3 + CloudFront
- Nginx
- Qualquer servidor de arquivos estáticos

## 🧪 Testing

```bash
# Testes unitários (quando configurado)
npm test

# Lint
npm run lint
```

## 🐛 Troubleshooting

### Frontend não conecta ao backend

1. Verifique se o backend está rodando em `http://localhost:8000`
2. Confirme que a variável `VITE_API_URL` está correta no `.env`
3. Verifique CORS no backend (deve permitir `http://localhost:5173`)

### Erro de CORS

O backend precisa ter configurado:
```python
CORS_ORIGINS=http://localhost:5173
```

### Hot-reload não funciona

```bash
# Limpe cache e reinstale
rm -rf node_modules package-lock.json
npm install
npm run dev
```

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Add: nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📚 Recursos

- [React Docs](https://react.dev)
- [Vite Guide](https://vitejs.dev/guide/)
- [shadcn/ui](https://ui.shadcn.com/)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [Zustand](https://github.com/pmndrs/zustand)

## 📄 Licença

[Especificar licença]

---

**Desenvolvido com ❤️ usando React + TypeScript + Vite**
