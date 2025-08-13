# LibreChat Prelab - 15-Minute Quick Start Guide

## 🎯 Objective
Get familiar with LibreChat's educational assessment capabilities using **100% FREE AI models** in under 15 minutes.

## ⏱️ Time Breakdown
- **Setup**: 5 minutes (automated script)
- **Basic Testing**: 5 minutes  
- **Feature Exploration**: 5 minutes

## 📋 Prerequisites
- Computer with 8GB+ RAM, 50GB+ disk space
- Docker and Docker Compose installed
- Internet connection
- **FREE Google Gemini API key** (recommended) OR use local models

---

## 🚀 Step 1: Quick Setup (5 minutes)

### Option A: Automated Setup (Recommended)
```bash
# Clone or download the setup script
curl -O https://raw.githubusercontent.com/[your-repo]/setup-prelab.sh
chmod +x setup-prelab.sh
./setup-prelab.sh
```

### Option B: Manual Setup
```bash
# Clone repository
git clone [your-repo-url]
cd librechat-demos

# Copy environment template
cp .env.example .env

# Edit .env file and add FREE API key
nano .env  # Add your GOOGLE_KEY

# Start services
docker compose up -d
```

### Get FREE API Keys

**Google Gemini (Recommended)**:
1. Visit https://ai.google.dev/
2. Sign in with Google account
3. Click "Get API key in Google AI Studio"
4. Create new project or use existing
5. Generate API key
6. **Free limits**: 15 requests/minute, 1M tokens/day

**Ollama (No API Key Needed)**:
- Models download automatically
- Completely free and unlimited
- Runs locally for privacy

### Wait for Services
⏳ **Wait 3-5 minutes** for containers to start and models to download.

---

## 🧪 Step 2: Basic Testing (5 minutes)

### Access LibreChat
1. Open browser to `http://localhost:3080`
2. **Create account** (any email/password for demo)
3. **Login** to the interface

### Test Basic Chat
1. **Select AI model** from dropdown (top-left)
   - Try "Gemini Flash (Free)" if you have API key
   - Or "llama3.2:3b" for local model
2. **Send test message**: 
   ```
   Hello! Can you explain what LibreChat is and how it helps with education?
   ```
3. **Verify response** appears correctly

### Test File Upload & Analysis
1. **Click attachment icon** (📎) in chat input
2. **Upload a test file**:
   - Text file (.txt, .md)
   - PDF document
   - Image (if using Gemini)
   - Code file (.py, .js)
3. **Ask**: `"What's in this file? Summarize the main points."`
4. **Verify** AI can read and analyze the content

### Test Image Analysis (Gemini Only)
1. **Upload an image** with text or diagrams
2. **Ask**: `"Describe what you see in this image"`
3. **Try**: `"Extract any text from this image"`
4. **Verify** multimodal capabilities work

---

## 🔧 Step 3: Feature Exploration (5 minutes)

### Test Model Switching
1. **Try different models** from dropdown:
   - Compare Gemini Flash vs Pro
   - Test local Llama vs CodeLlama
   - Notice speed and quality differences
2. **Send same question** to different models
3. **Compare responses** and capabilities

### Test Educational Features

**Code Generation & Review**:
```
Write a Python function to calculate fibonacci numbers. Then review the code for efficiency and suggest improvements.
```

**Interactive Content Creation**:
```
Create an interactive HTML quiz about photosynthesis with 3 multiple choice questions.
```

**Research & Fact-Checking**:
```
What are the latest developments in renewable energy? Please verify the information with recent sources.
```

### Test Conversation Features
1. **Edit a message** (pencil icon on your message)
2. **Branch conversation** (fork icon after AI response)
3. **Search messages** (🔍 icon in top bar)
4. **Try conversation templates** if available

### Test Artifacts Generation
1. **Ask**: `"Create a simple HTML page with a red button that says 'Click Me' and make it interactive"`
2. **Look for "Artifacts" panel** on the right side
3. **Verify** code appears and renders
4. **Try**: `"Now add a counter that increases when clicked"`

---

## ✅ Success Checklist

Mark each as completed:

**Setup Phase**:
- [ ] LibreChat running on localhost:3080
- [ ] Successfully created account and logged in
- [ ] At least one AI model working (Gemini or Ollama)

**Basic Testing**:
- [ ] AI responds to simple questions appropriately
- [ ] File upload and analysis working
- [ ] Can see different models in dropdown menu

**Feature Exploration**:
- [ ] Successfully switched between different AI models
- [ ] Generated code or interactive content
- [ ] Used conversation features (edit, branch, search)
- [ ] Artifacts panel shows generated content

**Educational Assessment Potential**:
- [ ] Tested code generation and review capabilities
- [ ] Verified document analysis for assignments
- [ ] Explored multimodal features (if using Gemini)
- [ ] Identified potential use cases for your courses

---

## 🐛 Common Issues & Quick Fixes

### "LibreChat won't start"
```bash
# Check container status
docker compose ps

# View logs for errors
docker compose logs librechat

# Restart everything
docker compose restart

# Nuclear option - reset everything
docker compose down -v
docker compose up -d
```

### "No AI models available"
- **Check API key** in `.env` file
- **Restart containers**: `docker compose restart`
- **Wait longer** - Ollama models take time to download
- **Check logs**: `docker compose logs ollama`

### "Can't access localhost:3080"
- **Wait 5+ minutes** for full startup
- **Try**: `http://127.0.0.1:3080`
- **Check ports**: `docker compose ps`
- **Restart Docker** if needed

### "File upload not working"
- **Try smaller files** first (< 5MB)
- **Use common formats** (.txt, .pdf, .png)
- **Refresh browser** page
- **Check model supports** file types

### "Models downloading slowly"
- **Models download in background** - you can start testing
- **Large models** (7B+) take 10-30 minutes depending on internet
- **Check download progress**: `docker compose logs ollama`

---

## 📝 Prelab Report Template

**Student Name**: _______________  
**Date**: _______________  
**Time to Complete**: _____ minutes

### 1. Setup Experience
- [ ] Easy (< 5 minutes)
- [ ] Moderate (5-10 minutes)  
- [ ] Challenging (> 10 minutes)
- **Issues encountered**: _______________

### 2. AI Models Tested
**Gemini (if used)**:
- Response quality (1-10): _____
- Speed (fast/medium/slow): _____
- Best feature: _______________

**Local Models (if used)**:
- Model name: _______________
- Response quality (1-10): _____
- Speed (fast/medium/slow): _____

### 3. Most Impressive Features
1. _______________
2. _______________
3. _______________

### 4. Educational Use Case Ideas
**For your courses**:
- Programming assessments: _______________
- Essay grading: _______________
- Research assistance: _______________
- Interactive content: _______________

### 5. Technical Observations
**Performance**:
- System responsiveness: _______________
- File upload speed: _______________
- Model switching: _______________

**Reliability**:
- Any errors encountered: _______________
- Overall stability: _______________

### 6. Questions for Class Discussion
1. _______________
2. _______________
3. _______________

---

## 🎯 Next Steps

### For Your Team
1. **Share observations** in team meeting
2. **Compare experiences** across different models
3. **Brainstorm assessment scenarios** for your subjects
4. **Plan comprehensive demo** implementation

### For Full Demo Project
1. **Review main repository** structure and goals
2. **Identify priority features** for your assessment needs
3. **Plan demo scenarios** for specific courses
4. **Consider deployment** requirements for your institution

### Advanced Exploration (Optional)
1. **Try different model combinations** for specific tasks
2. **Experiment with complex prompts** for assessment scenarios
3. **Test multimodal capabilities** with various file types
4. **Explore conversation branching** for different learning paths

---

## 🆘 Getting Help

### Immediate Issues
- **Check troubleshooting section** above
- **Review logs**: `docker compose logs`
- **Try safe restart**: `docker compose restart`

### For Demo Project
- **Main documentation**: `docs/setup-guide.md`
- **Feature guides**: `docs/feature-demos.md`
- **Assessment platform**: `docs/assessment-platform-guide.md`

### Community Resources
- **LibreChat docs**: https://www.librechat.ai/docs
- **GitHub issues**: https://github.com/danny-avila/LibreChat/issues
- **Educational examples**: `demos/` folder in main repository

---

## 🎉 Congratulations!

If you completed this prelab successfully, you've:

✅ **Set up LibreChat** with free AI models  
✅ **Tested core functionality** for educational use  
✅ **Explored assessment potential** with real AI capabilities  
✅ **Identified practical applications** for your courses  
✅ **Gained hands-on experience** with cutting-edge educational AI  

**You're now ready** to contribute to building comprehensive educational assessment demos that could transform how institutions evaluate student learning! 🚀

---

## 💡 Cost Savings Achieved

By completing this prelab with free models:

- **$0 spent** on AI API costs
- **Enterprise-grade capabilities** without subscription fees
- **Scalable solution** for unlimited students
- **Privacy-preserving** with local model options

**Estimated value**: $100-1000+ saved compared to commercial AI assessment platforms for similar functionality during this testing period.

Perfect foundation for building cost-effective educational AI tools! 🎓✨
