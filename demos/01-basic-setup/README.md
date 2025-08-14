# Demo 01: Basic LibreChat Setup

## Objective
Demonstrate the fundamental setup and basic functionality of LibreChat with free AI models for educational use.

## Duration
15 minutes - Perfect for quick evaluation

## Cost
$0 - Uses only free AI models and services

---

## Prerequisites

- Docker and Docker Compose installed
- 8GB+ RAM, 50GB+ disk space
- Internet connection
- Optional: Free Google Gemini API key

---

## Demo Steps

### Step 1: Environment Setup (5 minutes)

1. **Clone Repository**:
   ```bash
   git clone [repo-url]
   cd librechat-demos
   ```

2. **Quick Setup**:
   ```bash
   chmod +x setup-prelab.sh
   ./setup-prelab.sh
   ```

3. **Verify Services**:
   ```bash
   docker compose ps
   # Should show all services as "Up"
   ```

### Step 2: First Login (3 minutes)

1. **Access LibreChat**:
   - Open browser to `http://localhost:3080`
   - Should see LibreChat login page

2. **Create Account**:
   - Click "Sign Up"
   - Use any email/password (demo purposes)
   - Complete registration

3. **Login**:
   - Use credentials to log in
   - Should see main chat interface

### Step 3: Model Testing (7 minutes)

1. **Select AI Model**:
   - Click model dropdown (top-left)
   - Available options depend on configuration:
     - **Gemini Flash (Free)** - if API key configured
     - **llama3.2:3b** - local model (always available)
     - **codellama:7b-code** - programming model

2. **Basic Chat Test**:
   ```
   Prompt: "Hello! Please explain what LibreChat is and how it can help with education."
   
   Expected: Detailed explanation of LibreChat's educational capabilities
   ```

3. **Educational Query**:
   ```
   Prompt: "Explain photosynthesis to a 10th-grade student with a simple analogy."
   
   Expected: Age-appropriate explanation with analogy
   ```

4. **Model Comparison**:
   - Try the same question with different models
   - Compare response quality and speed
   - Note differences in capabilities

---

## Success Criteria

Mark each as completed:

**Setup Phase**:
- [ ] All Docker services running (`docker compose ps`)
- [ ] LibreChat accessible at localhost:3080
- [ ] Account created and login successful

**Basic Functionality**:
- [ ] At least one AI model available in dropdown
- [ ] AI responds appropriately to simple questions
- [ ] Interface is responsive and user-friendly

**Educational Readiness**:
- [ ] AI provides educational explanations
- [ ] Multiple models available for comparison
- [ ] System stable for continued use

---

## Educational Applications Demonstrated

### For Students
- **24/7 Tutoring**: AI available anytime for questions
- **Multiple Perspectives**: Different models offer varied explanations
- **Interactive Learning**: Conversational interface encourages exploration

### For Professors
- **Content Generation**: AI assists with creating educational materials
- **Student Support**: Reduces repetitive question load
- **Assessment Preparation**: AI helps develop questions and rubrics

### For Administrators
- **Cost Savings**: Free alternative to expensive AI tutoring platforms
- **Scalability**: Supports unlimited concurrent users
- **Privacy**: Local models keep sensitive data on-premises

---

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
# Check Ollama model download
docker compose logs ollama

# Manually download models
docker compose exec ollama ollama pull llama3.2:3b

# Check API key configuration
grep GOOGLE_KEY .env
```

**"Slow responses"**:
- First model download takes time
- Subsequent responses should be faster
- Try smaller models (llama3.2:3b vs codellama:7b)

### Quick Fixes

```bash
# Restart everything
docker compose restart

# Check logs for errors
docker compose logs

# Reset if needed
docker compose down -v
docker compose up -d
```

---

## Demo Results

### Performance Metrics
- **Setup Time**: ~5 minutes (automated)
- **First Response**: ~30 seconds (model loading)
- **Subsequent Responses**: 2-10 seconds
- **Resource Usage**: ~4GB RAM, ~20GB disk

### Model Comparison
| Model | Speed | Quality | Best For |
|-------|-------|---------|----------|
| **Gemini Flash** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | Quick Q&A, general help |
| **Gemini Pro** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Complex analysis, research |
| **Llama 3.2** | ⭐⭐⭐⭐ | ⭐⭐⭐ | Privacy-focused, unlimited use |
| **CodeLlama** | ⭐⭐⭐ | ⭐⭐⭐⭐ | Programming, code review |

### Cost Analysis
- **Setup Cost**: $0
- **Ongoing Cost**: $0 (with free models)
- **Commercial Equivalent**: $50-200/month for similar capabilities
- **Annual Savings**: $600-2,400 per deployment

---

## Next Steps

### Immediate
1. **Explore Features**: Try file upload, conversation branching
2. **Test Models**: Compare different AI models for your use cases
3. **Plan Integration**: Consider how to integrate with existing workflows

### Short-term
1. **Faculty Training**: Show colleagues the basic functionality
2. **Pilot Program**: Test with small group of students/faculty
3. **Feedback Collection**: Gather input on educational applications

### Long-term
1. **Full Deployment**: Scale to department or institution level
2. **Advanced Features**: Explore agents, MCP servers, code interpreter
3. **Custom Configuration**: Tailor for specific educational needs

---

## Demo Report Template

**Date**: _______________  
**Demonstrator**: _______________  
**Audience**: _______________

### Setup Experience
- **Time to complete**: _____ minutes
- **Issues encountered**: _______________
- **Overall difficulty**: Easy / Moderate / Challenging

### Model Performance
**Gemini (if tested)**:
- Response quality (1-10): _____
- Speed: Fast / Medium / Slow
- Best feature: _______________

**Local Models (if tested)**:
- Response quality (1-10): _____
- Speed: Fast / Medium / Slow
- Privacy benefit: _______________

### Educational Potential
**Most promising applications**:
1. _______________
2. _______________
3. _______________

**Concerns or limitations**:
1. _______________
2. _______________
3. _______________

### Recommendation
- [ ] **Proceed with pilot program**
- [ ] **Need more evaluation**
- [ ] **Not suitable for our needs**

**Reasoning**: _______________

---

## Congratulations!

You've successfully demonstrated LibreChat's basic capabilities with free AI models. This foundation shows how educational institutions can access enterprise-grade AI capabilities without enterprise costs.

Key Achievements:
- Zero-cost AI platform operational
- Multiple AI models available and tested
- Educational applications identified
- Scalable foundation established

Ready for the next demo? Try [Demo 02: MCP Integration](../02-mcp-integration/) to see how LibreChat extends beyond basic chat!

Built for Education, Powered by Free AI
