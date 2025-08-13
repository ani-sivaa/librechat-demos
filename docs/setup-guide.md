# Complete LibreChat Setup Guide

## 🎯 Overview

This comprehensive guide walks you through setting up LibreChat for educational assessment using **100% FREE AI models**. Perfect for institutions wanting enterprise-grade AI capabilities without the enterprise costs.

## 💰 Cost Benefits

**Annual Savings**: $1,000 - $10,000 compared to commercial AI platforms
- **Google Gemini Free**: 1M tokens/day vs. $7/1M tokens paid
- **Ollama Local**: Unlimited usage vs. $15-30/1M tokens
- **No vendor lock-in**: Switch models freely

---

## 📋 Prerequisites

### System Requirements

**Minimum**:
- 8GB RAM
- 4 CPU cores
- 50GB disk space
- Docker & Docker Compose
- Internet connection

**Recommended**:
- 16GB RAM
- 8 CPU cores
- 100GB disk space
- GPU (for faster local models)
- Dedicated server for production

### Software Dependencies

```bash
# Install Docker (Ubuntu/Debian)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify installation
docker --version
docker-compose --version
```

---

## 🚀 Installation Steps

### Step 1: Clone Repository

```bash
git clone [your-repo-url]
cd librechat-demos
```

### Step 2: Configure Environment

```bash
# Copy environment template
cp .env.example .env

# Edit configuration
nano .env
```

**Required Configuration**:
```bash
# Core settings
MONGO_URI=mongodb://mongo:27017/librechat
HOST=localhost
PORT=3080

# FREE AI Models (choose one or more)
GOOGLE_KEY=your_free_gemini_api_key_here
GROQ_API_KEY=your_free_groq_api_key_here
OLLAMA_BASE_URL=http://ollama:11434

# Security (generate new secrets)
JWT_SECRET=$(openssl rand -base64 32)
SESSION_SECRET=$(openssl rand -base64 32)

# Educational features
ALLOW_REGISTRATION=true
ENABLE_ARTIFACTS=true
ENABLE_AGENTS=true
ENABLE_MCP=true
```

### Step 3: Get FREE API Keys

#### Google Gemini (Recommended)
1. Visit https://ai.google.dev/
2. Sign in with Google account
3. Click "Get API key in Google AI Studio"
4. Create new project
5. Generate API key
6. Add to `.env` file: `GOOGLE_KEY=your_key_here`

**Free Limits**: 15 RPM, 1M tokens/day

#### Groq (Optional)
1. Visit https://console.groq.com/
2. Create free account
3. Generate API key
4. Add to `.env` file: `GROQ_API_KEY=your_key_here`

**Free Limits**: 30 RPM, very fast inference

#### Ollama (No API Key Needed)
- Models download automatically
- Completely free and unlimited
- Runs locally for privacy

### Step 4: Start Services

```bash
# Pull latest images
docker compose pull

# Start all services
docker compose up -d

# Check status
docker compose ps
```

### Step 5: Download AI Models

**Automatic Download** (recommended):
```bash
# Models download automatically via model-setup service
# Check progress:
docker compose logs model-setup
```

**Manual Download**:
```bash
# Download specific models
docker compose exec ollama ollama pull llama3.2:3b
docker compose exec ollama ollama pull codellama:7b-code
docker compose exec ollama ollama pull mistral:7b
docker compose exec ollama ollama pull gemma2:2b
```

### Step 6: Verify Installation

```bash
# Check all services are running
docker compose ps

# Test LibreChat access
curl http://localhost:3080

# Check logs for errors
docker compose logs librechat
```

---

## 🔧 Configuration Details

### LibreChat Configuration (librechat.yaml)

```yaml
version: 1.1.7
cache: true

# Educational institution settings
registration:
  socialLogins: ["github", "google"]
  allowedDomains: ["youruniversity.edu"]

# FREE AI model endpoints
endpoints:
  google:
    apiKey: "${GOOGLE_KEY}"
    models:
      gemini-1.5-pro:
        displayName: "Gemini Pro (Free)"
        maxContextTokens: 1048576
      gemini-1.5-flash:
        displayName: "Gemini Flash (Free)"
        maxContextTokens: 1048576

  custom:
    - name: "Local AI Models (Free)"
      baseURL: "http://ollama:11434/v1"
      models:
        default: ["llama3.2:3b", "codellama:7b-code"]
        fetch: true

# Educational file handling
fileConfig:
  endpoints:
    google:
      fileLimit: 20
      fileSizeLimit: 25  # MB
      supportedMimeTypes:
        - "application/pdf"
        - "text/plain"
        - "image/jpeg"
        - "text/x-python"
```

### Docker Compose Services

**Core Services**:
- **librechat**: Main application
- **mongo**: Database
- **redis**: Caching
- **meilisearch**: Search functionality

**AI Services**:
- **ollama**: Local AI models
- **model-setup**: Automatic model downloads

---

## 🎓 Educational Features Setup

### MCP Servers (Model Context Protocol)

```yaml
mcpServers:
  # File system access for assignments
  assessment-filesystem:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-filesystem", "/app/demos"]
    description: "Access demo files and student submissions"
    
  # Web search for research
  web-search:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-web-search"]
    description: "Search the web for current information"
```

### AI Agents Configuration

Create specialized agents through the UI:

**Math Tutor Agent**:
- Model: gemini-1.5-pro
- Tools: code_interpreter, web_search
- Instructions: "Specialized in mathematics assessment and tutoring"

**Code Review Agent**:
- Model: codellama:7b-code
- Tools: code_interpreter, filesystem
- Instructions: "Review programming assignments and provide feedback"

**Essay Grader Agent**:
- Model: gemini-1.5-flash
- Tools: web_search, file_context
- Instructions: "Grade essays using rubrics and provide detailed feedback"

### File Upload Configuration

```yaml
fileConfig:
  endpoints:
    google:
      fileLimit: 20
      fileSizeLimit: 25  # MB
      supportedMimeTypes:
        # Documents
        - "application/pdf"
        - "text/plain"
        - "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        # Code files
        - "text/x-python"
        - "text/javascript"
        - "text/x-java-source"
        # Images
        - "image/jpeg"
        - "image/png"
```

---

## 🔒 Security & Compliance

### FERPA Compliance Settings

```bash
# Student data retention (7 years)
STUDENT_DATA_RETENTION_DAYS=2555
AUDIT_LOGGING=true
DATA_ENCRYPTION=true

# Privacy controls
ANONYMIZE_STUDENT_DATA=false
EXPORT_USER_DATA=true
DELETE_USER_DATA=true
```

### Access Control

```bash
# Restrict registration to educational domains
ALLOWED_EMAIL_DOMAINS=youruniversity.edu,school.edu

# Enable social logins for convenience
GITHUB_CLIENT_ID=your_github_client_id
GOOGLE_CLIENT_ID=your_google_oauth_client_id
```

### Rate Limiting

```yaml
rateLimits:
  fileUploads:
    windowMs: 900000  # 15 minutes
    max: 50
  conversationsImport:
    windowMs: 3600000  # 1 hour
    max: 5
```

---

## 📊 Monitoring & Maintenance

### Health Checks

```bash
# Check service status
docker compose ps

# View logs
docker compose logs librechat
docker compose logs ollama
docker compose logs mongo

# Monitor resource usage
docker stats
```

### Backup Strategy

```bash
# Backup MongoDB data
docker compose exec mongo mongodump --out /backup

# Backup configuration
tar -czf librechat-config-backup.tar.gz .env librechat.yaml docker-compose.yml

# Backup Ollama models
docker compose exec ollama tar -czf /backup/ollama-models.tar.gz /root/.ollama
```

### Updates

```bash
# Update LibreChat
docker compose pull librechat
docker compose up -d librechat

# Update Ollama models
docker compose exec ollama ollama pull llama3.2:3b
```

---

## 🚀 Production Deployment

### Environment Optimization

```bash
# Production environment variables
NODE_ENV=production
LOG_LEVEL=warn
DEBUG_LOGGING=false

# Performance settings
WORKER_PROCESSES=auto
ENABLE_CLUSTERING=true
CACHE_TTL=3600

# Security hardening
RATE_LIMIT_MAX=100
MAX_CONCURRENT_REQUESTS=10
```

### SSL/TLS Setup

```yaml
# Add to docker-compose.yml
services:
  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./ssl:/etc/nginx/ssl
    depends_on:
      - librechat
```

### Load Balancing

```yaml
# Multiple LibreChat instances
services:
  librechat-1:
    image: ghcr.io/danny-avila/librechat-dev:latest
    # ... configuration
  
  librechat-2:
    image: ghcr.io/danny-avila/librechat-dev:latest
    # ... configuration
    
  nginx:
    # Load balancer configuration
```

---

## 🐛 Troubleshooting

### Common Issues

**LibreChat won't start**:
```bash
# Check logs
docker compose logs librechat

# Common fixes
docker compose restart
docker compose down -v && docker compose up -d
```

**Models not available**:
```bash
# Check Ollama status
docker compose logs ollama

# Manually download models
docker compose exec ollama ollama pull llama3.2:3b
```

**File uploads failing**:
- Check file size limits in librechat.yaml
- Verify supported MIME types
- Check disk space: `df -h`

**Performance issues**:
- Monitor resources: `docker stats`
- Increase memory limits in docker-compose.yml
- Consider GPU acceleration for Ollama

### Log Analysis

```bash
# Real-time logs
docker compose logs -f librechat

# Search for errors
docker compose logs librechat | grep ERROR

# Export logs for analysis
docker compose logs > librechat-logs.txt
```

---

## 📈 Success Metrics

After completing setup:

- ✅ **LibreChat accessible** at http://localhost:3080
- ✅ **Multiple AI models** working (Gemini + Ollama)
- ✅ **File uploads** functioning for all supported types
- ✅ **MCP servers** enabled for enhanced capabilities
- ✅ **Educational agents** configured and tested
- ✅ **Security settings** properly configured
- ✅ **Monitoring** and backup procedures in place

## 🎯 Next Steps

1. **Test all features** using the [Feature Demos Guide](feature-demos.md)
2. **Configure assessment workflows** with [Assessment Platform Guide](assessment-platform-guide.md)
3. **Train faculty** on educational use cases
4. **Plan production deployment** for your institution

---

**Ready to transform education with free AI?** Your LibreChat platform is now ready for comprehensive educational assessment! 🎓✨
