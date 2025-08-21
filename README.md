# LibreChat Demo Repository

## Overview
Two production-ready LibreChat demonstrations showcasing core platform capabilities using free-tier API keys from Google Gemini and Groq.

## Demo 1: Multi-Model Comparison Platform
Compare responses from different AI models side-by-side to evaluate their strengths for various tasks.

### Features:
- Configure multiple AI models (Gemini, Llama 3.3, 3.2, 3.1)
- Switch between models seamlessly
- Compare responses to identical prompts
- Export conversation history
- File upload support for images and PDFs

### Use Cases:
- Model evaluation for specific tasks
- Quality comparison
- Performance benchmarking
- Cost-benefit analysis

## Demo 2: Preset-Based Workspace
Create specialized AI assistants with saved configurations for different tasks.

### Features:
- Pre-configured assistants (Developer, Writer, Analyst, etc.)
- Custom system messages per preset
- Optimized parameters for each use case
- Quick switching between contexts
- Conversation search and history

### Use Cases:
- Role-specific assistance
- Consistent formatting and style
- Task optimization
- Team standardization

## Quick Start

### Prerequisites
- Docker and Docker Compose
- Google AI Studio API key (free)
- Groq API key (free)

### Installation
```bash
# Clone repository
git clone https://github.com/ani-sivaa/librechat-demos.git
cd librechat-demos

# Choose your demo
cd demo1-multi-model-comparison
# or
cd demo2-preset-workspace

# Copy environment file
cp .env.example .env

# Add your API keys to .env
nano .env

# Start LibreChat
docker-compose up -d

# Access at http://localhost:3080
```

## API Setup Guide

### Getting Gemini API Key (Free)
1. Visit https://makersuite.google.com/app/apikey
2. Click "Create API Key"
3. Copy the key

### Getting Groq API Key (Free)
1. Visit https://console.groq.com
2. Sign up for free account
3. Go to API Keys section
4. Create new API key

## Features Comparison

| Feature | Demo 1 | Demo 2 |
|---------|--------|--------|
| Multiple Models | ✅ | ✅ |
| Model Comparison | ✅ | ❌ |
| Presets | ❌ | ✅ |
| Custom Parameters | Basic | Advanced |
| File Upload | ✅ | ✅ |
| Export/Import | ✅ | ✅ |
| Best For | Evaluation | Production |

## Documentation
- [Configuration Guide](documentation/configuration-guide.md)
- [API Setup](documentation/api-setup.md)
- [Troubleshooting](documentation/troubleshooting.md)

## Support
- LibreChat Docs: https://www.librechat.ai/
- GitHub Issues: [Create Issue](issues)

## License
MIT License - See LICENSE file
