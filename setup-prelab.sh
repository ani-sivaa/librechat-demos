#!/bin/bash


set -e  # Exit on any error

echo "🎓 LibreChat Educational Assessment Platform"
echo "🚀 15-Minute Prelab Setup Starting..."
echo ""

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color


echo "📋 Checking prerequisites..."

if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker not found.${NC}"
    echo "Please install Docker: https://docs.docker.com/get-docker/"
    exit 1
fi

if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
    echo -e "${RED}❌ Docker Compose not found.${NC}"
    echo "Please install Docker Compose: https://docs.docker.com/compose/install/"
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git not found.${NC}"
    echo "Please install Git: https://git-scm.com/downloads"
    exit 1
fi

echo -e "${GREEN}✅ Prerequisites check passed!${NC}"
echo ""


PROJECT_DIR="librechat-demos"

if [[ "${PWD##*/}" == "$PROJECT_DIR" ]]; then
    echo "📁 Already in LibreChat demos directory"
else
    if [ ! -d "$PROJECT_DIR" ]; then
        echo "📥 Setting up project directory..."
        mkdir -p "$PROJECT_DIR"
    else
        echo "📁 Project directory already exists"
    fi
    cd "$PROJECT_DIR"
fi


if [ ! -f ".env" ]; then
    echo "⚙️ Creating .env file..."
    
    cat > .env << EOF
MONGO_URI=mongodb://mongo:27017/librechat
HOST=localhost
PORT=3080

GOOGLE_KEY=

GROQ_API_KEY=
HUGGINGFACE_API_KEY=

OLLAMA_BASE_URL=http://ollama:11434

SEARCH=true
MEILI_HOST=http://meilisearch:7700
MEILI_MASTER_KEY=demo_master_key

JWT_SECRET=$(openssl rand -base64 32)
SESSION_SECRET=$(openssl rand -base64 32)

ALLOW_REGISTRATION=true
ENABLE_ARTIFACTS=true
ENABLE_AGENTS=true
ENABLE_MCP=true
EOF

    echo ""
    echo -e "${YELLOW}🔑 IMPORTANT: Configure your FREE API keys!${NC}"
    echo ""
    echo -e "${BLUE}Option 1 (Recommended): Google Gemini FREE API${NC}"
    echo "   • Get free key at: https://ai.google.dev/"
    echo "   • 1M tokens/day free tier"
    echo "   • Excellent for multimodal assessments"
    echo ""
    echo -e "${BLUE}Option 2: Local Models (NO API KEY NEEDED)${NC}"
    echo "   • Ollama downloads models automatically"
    echo "   • Completely free and private"
    echo "   • Unlimited usage"
    echo ""
    echo -e "${BLUE}Option 3: Groq FREE tier${NC}"
    echo "   • Get free key at: https://console.groq.com/"
    echo "   • Very fast inference"
    echo "   • Good for quick responses"
    echo ""
    
    read -p "Would you like to add a Gemini API key now? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Paste your Gemini API key (or press Enter to skip):"
        read -r GEMINI_KEY
        if [ ! -z "$GEMINI_KEY" ]; then
            sed -i "s/GOOGLE_KEY=/GOOGLE_KEY=$GEMINI_KEY/" .env
            echo -e "${GREEN}✅ Gemini API key configured!${NC}"
        fi
    fi
    
else
    echo -e "${GREEN}✅ .env file already exists${NC}"
fi


if [ ! -f "docker-compose.yml" ]; then
    echo "🐳 Creating Docker configuration..."
    
    cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  librechat:
    image: ghcr.io/danny-avila/librechat-dev:latest
    ports:
      - "3080:3080"
    environment:
      - MONGO_URI=mongodb://mongo:27017/librechat
      - REDIS_URI=redis://redis:6379
      - GOOGLE_KEY=${GOOGLE_KEY}
      - OLLAMA_BASE_URL=http://ollama:11434
      - GROQ_API_KEY=${GROQ_API_KEY}
      - SEARCH=true
      - MEILI_HOST=http://meilisearch:7700
      - MEILI_MASTER_KEY=demo_master_key
    volumes:
      - ./librechat.yaml:/app/librechat.yaml:ro
      - librechat_logs:/app/logs
    depends_on:
      - mongo
      - redis
      - ollama
      - meilisearch
    restart: unless-stopped

  mongo:
    image: mongo:7
    ports:
      - "27017:27017"
    volumes:
      - mongo_data:/data/db
    restart: unless-stopped

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data
    restart: unless-stopped

  ollama:
    image: ollama/ollama:latest
    ports:
      - "11434:11434"
    volumes:
      - ollama_data:/root/.ollama
    environment:
      - OLLAMA_HOST=0.0.0.0
      - OLLAMA_KEEP_ALIVE=24h
    restart: unless-stopped

  meilisearch:
    image: getmeili/meilisearch:v1.5
    ports:
      - "7700:7700"
    volumes:
      - meilisearch_data:/meili_data
    environment:
      - MEILI_MASTER_KEY=demo_master_key
    restart: unless-stopped

volumes:
  mongo_data:
  redis_data:
  ollama_data:
  meilisearch_data:
  librechat_logs:
EOF
    
    echo -e "${GREEN}✅ Docker configuration created${NC}"
fi

if [ ! -f "librechat.yaml" ]; then
    echo "⚙️ Creating LibreChat configuration..."
    
    cat > librechat.yaml << 'EOF'
version: 1.1.7

cache: true

registration:
  socialLogins: ["github", "google"]

endpoints:
  google:
    apiKey: "${GOOGLE_KEY}"
    models:
      gemini-1.5-flash:
        displayName: "Gemini Flash (Free)"
      gemini-1.5-pro:
        displayName: "Gemini Pro (Free)"

  custom:
    - name: "Local AI (Free)"
      baseURL: "http://ollama:11434/v1"
      apiKey: "dummy"
      models:
        default: ["llama3.2:3b", "codellama:7b-code"]
        fetch: true
      titleConvo: true

fileConfig:
  endpoints:
    google:
      fileLimit: 10
      fileSizeLimit: 25
      supportedMimeTypes:
        - "application/pdf"
        - "text/plain"
        - "image/jpeg"
        - "image/png"
        - "text/x-python"
EOF
    
    echo -e "${GREEN}✅ LibreChat configuration created${NC}"
fi


echo ""
echo "🏃 Starting LibreChat services..."
echo "This may take 3-5 minutes on first run..."

docker compose pull
docker compose up -d

echo ""
echo "⏳ Waiting for services to initialize..."

for i in {1..10}; do
    echo -n "."
    sleep 3
done
echo ""


echo "📥 Setting up free AI models..."

{
    sleep 30  # Wait for Ollama to start
    echo "Downloading Llama 3.2 (3B)..."
    docker compose exec -T ollama ollama pull llama3.2:3b
    echo "Downloading CodeLlama (7B)..."  
    docker compose exec -T ollama ollama pull codellama:7b-code
    echo "Downloading Mistral (7B)..."
    docker compose exec -T ollama ollama pull mistral:7b
    echo "Models downloaded successfully!"
} &

MODEL_DOWNLOAD_PID=$!


echo "🔍 Checking service health..."

for i in {1..30}; do
    if curl -s http://localhost:3080 > /dev/null 2>&1; then
        echo -e "${GREEN}✅ LibreChat is responding!${NC}"
        break
    fi
    if [ $i -eq 30 ]; then
        echo -e "${RED}❌ LibreChat not responding after 3 minutes${NC}"
        echo "Check logs with: docker compose logs librechat"
        exit 1
    fi
    echo -n "."
    sleep 6
done


echo ""
echo -e "${GREEN}🎉 LibreChat Educational Demo Setup Complete!${NC}"
echo ""
echo -e "${BLUE}🌐 Access LibreChat at: http://localhost:3080${NC}"
echo ""
echo "📋 Next steps for 15-minute prelab:"
echo "   1. Open browser to http://localhost:3080"
echo "   2. Create an account (any email/password)"
echo "   3. Test basic chat functionality"
echo "   4. Try file upload and analysis"
echo "   5. Explore different AI models"
echo ""
echo -e "${YELLOW}💡 Tips:${NC}"
echo "   • Select your AI model from top-left dropdown"
echo "   • Upload files using the 📎 attachment icon"
echo "   • Try image analysis if using Gemini"
echo "   • Use artifacts for interactive content"
echo ""
echo -e "${BLUE}🆘 If you encounter issues:${NC}"
echo "   • Check logs: docker compose logs"
echo "   • Restart: docker compose restart"
echo "   • Reset: docker compose down -v && docker compose up -d"
echo ""
echo -e "${GREEN}📚 Documentation:${NC}"
echo "   • Prelab guide: docs/prelab-guide.md"
echo "   • Full features: docs/feature-demos.md"
echo "   • Troubleshooting: docs/troubleshooting.md"
echo ""

echo "⏳ Model downloads continuing in background..."
echo "You can start using LibreChat now while models download."
echo ""

if docker compose ps | grep -q "Up"; then
    echo -e "${GREEN}✅ All services running successfully!${NC}"
    echo ""
    echo "🚀 Ready for 15-minute prelab testing!"
    echo "📖 Follow the testing guide in docs/prelab-guide.md"
else
    echo -e "${YELLOW}⚠️ Some services may still be starting...${NC}"
    echo "Wait another minute and check: docker compose ps"
fi

echo ""
echo "🎓 Happy learning with AI-powered education! ✨"
