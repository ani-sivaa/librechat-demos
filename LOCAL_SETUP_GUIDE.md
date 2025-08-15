# Local Setup Guide for LibreChat Demos

This guide provides step-by-step instructions to run all LibreChat demos on your local computer.

## Prerequisites

Before starting, ensure you have:
- Docker and Docker Compose installed
- 8GB+ RAM available
- 50GB+ free disk space
- Internet connection
- Git installed

## Quick Start (Recommended)

### Step 1: Clone the Repository

```bash
git clone https://github.com/ani-sivaa/librechat-demos.git
cd librechat-demos
```

### Step 2: Run the Quick Setup

```bash
chmod +x setup-prelab.sh
./setup-prelab.sh
```

This will:
- Set up Docker containers
- Download free AI models
- Configure LibreChat
- Start all services

### Step 3: Access LibreChat

1. Wait 3-5 minutes for initial setup to complete
2. Open your browser to: http://localhost:3080
3. Create an account (use any email/password for demo)
4. Login and start using LibreChat

## Demo-by-Demo Instructions

### Demo 01: Basic Setup

**What it demonstrates**: Basic LibreChat functionality with free AI models

**Steps to test**:
1. Access LibreChat at http://localhost:3080
2. Create account and login
3. Select an AI model from the dropdown (top-left)
4. Try these test prompts:
   ```
   "Hello! Please explain what LibreChat is and how it can help with education."
   
   "Explain photosynthesis to a 10th-grade student with a simple analogy."
   ```
5. Compare responses from different models if available

**Success criteria**:
- LibreChat interface loads properly
- At least one AI model responds to questions
- Educational explanations are appropriate and helpful

### Demo 02: MCP Integration (Enhanced Tools)

**What it demonstrates**: File system access and web search capabilities

**Steps to test**:
1. Ensure LibreChat is running from Demo 01
2. Create sample files for testing:
   ```bash
   mkdir -p sample-submissions
   
   # Create a sample Python file
   cat > sample-submissions/student_code.py << 'EOF'
   def fibonacci(n):
       if n <= 1:
           return n
       else:
           return fibonacci(n-1) + fibonacci(n-2)
   
   for i in range(10):
       print(f"F({i}) = {fibonacci(i)}")
   EOF
   
   # Create a sample essay
   cat > sample-submissions/essay.txt << 'EOF'
   Climate Change and Its Impact on Education
   
   Climate change affects educational systems worldwide. Schools face challenges from extreme weather events, and students miss instruction time when schools close.
   
   Educational institutions must develop climate-resilient infrastructure and incorporate climate education into curricula to prepare students for the future.
   EOF
   ```

3. Test file analysis in LibreChat:
   ```
   "Please analyze the Python code in the file student_code.py. Evaluate it for correctness, efficiency, and code style. Suggest improvements and assign a grade out of 100."
   
   "Please grade the essay in essay.txt using this rubric:
   - Thesis clarity (25 points)
   - Supporting evidence (25 points) 
   - Organization (25 points)
   - Grammar and style (25 points)
   Provide detailed feedback and a total score."
   ```

4. Test web search capabilities:
   ```
   "Search for the latest developments in AI in education from 2024. Provide three recent breakthroughs with credible sources."
   
   "Fact-check this claim: 'Solar power costs have decreased by 80% since 2010'. Verify with current sources."
   ```

**Success criteria**:
- AI can read and analyze the sample files
- Web search returns current, relevant information
- File analysis provides detailed, educational feedback

## Troubleshooting

### Common Issues

**"Can't access localhost:3080"**:
```bash
# Check if services are running
docker compose ps

# Wait longer for startup (first run takes 3-5 minutes)
docker compose logs librechat

# Try alternative URL
http://127.0.0.1:3080
```

**"No models available"**:
```bash
# Check model download progress
docker compose logs ollama

# Manually download models if needed
docker compose exec ollama ollama pull llama3.2:3b

# Restart services
docker compose restart
```

**"Slow responses"**:
- First model download takes time
- Subsequent responses should be faster
- Try smaller models first (llama3.2:3b)

**"MCP tools not working"**:
```bash
# Check MCP server status
docker compose logs librechat | grep -i mcp

# Restart LibreChat
docker compose restart librechat

# Verify file permissions
ls -la sample-submissions/
```

### Quick Fixes

```bash
# Restart everything
docker compose restart

# Check logs for errors
docker compose logs

# Complete reset if needed
docker compose down -v
docker compose up -d
```

## Advanced Configuration

### Adding Your Own API Keys

If you want to use additional AI models:

1. Copy the environment template:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` and add your API keys:
   ```bash
   # For Google Gemini (free tier available)
   GOOGLE_KEY=your_gemini_api_key_here
   
   # For OpenAI (paid)
   OPENAI_API_KEY=your_openai_key_here
   ```

3. Restart services:
   ```bash
   docker compose restart
   ```

### Customizing Models

Edit `librechat.yaml` to add or modify AI models:

```yaml
endpoints:
  custom:
    - name: "Custom Model"
      apiKey: "${YOUR_API_KEY}"
      baseURL: "https://api.example.com/v1"
      models:
        default: ["custom-model-name"]
```

## Performance Optimization

### System Requirements

**Minimum**:
- 8GB RAM
- 4 CPU cores
- 50GB disk space

**Recommended**:
- 16GB RAM
- 8 CPU cores
- 100GB disk space
- GPU (for faster local models)

### Optimizing for Your System

**For lower-end systems**:
```bash
# Use smaller models
docker compose exec ollama ollama pull llama3.2:1b

# Reduce concurrent processes
# Edit docker-compose.yml and reduce resource limits
```

**For higher-end systems**:
```bash
# Download larger, more capable models
docker compose exec ollama ollama pull llama3.2:7b
docker compose exec ollama ollama pull codellama:13b
```

## Educational Use Cases

### For Students
- 24/7 AI tutoring and homework help
- Code debugging and programming assistance
- Research help with source verification
- Writing feedback and improvement suggestions

### For Educators
- Automated grading and feedback generation
- Content creation assistance
- Student progress tracking
- Curriculum development support

### For Institutions
- Cost-effective AI infrastructure
- Privacy-compliant local processing
- Scalable to unlimited users
- Integration with existing systems

## Next Steps

After successfully running the demos:

1. **Explore Features**: Try file uploads, conversation branching, different models
2. **Test with Real Content**: Upload actual assignments or documents
3. **Customize Configuration**: Tailor settings for your specific needs
4. **Plan Integration**: Consider how to integrate with existing workflows
5. **Scale Up**: Move from demo to production deployment

## Support

If you encounter issues:

1. Check the troubleshooting section above
2. Review logs: `docker compose logs`
3. Ensure system requirements are met
4. Try the complete reset procedure
5. Check the documentation in the `/docs` folder

## Cost Analysis

**Total Cost**: $0 for basic setup
- All included models are completely free
- No API costs for local models
- Optional: Add paid API keys for premium models

**Compared to Commercial Solutions**:
- Traditional LMS tools: $50-200/month per instructor
- AI tutoring platforms: $100-500/month per department
- LibreChat: $0/month with enterprise capabilities

This setup provides enterprise-grade AI capabilities at zero cost, making it perfect for educational institutions of any size.
