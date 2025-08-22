# LibreChat Demos Video Script for Screen Studio

## Video Overview
**Duration**: 8-10 minutes  
**Target Audience**: Lab Professor  
**Purpose**: Demonstrate two practical LibreChat configurations for educational use  
**Recording Tool**: Screen Studio  

---

## Introduction (30 seconds)

### Opening Shot: Repository Overview
**Screen**: GitHub repository page (https://github.com/ani-sivaa/librechat-demos)

**Narration**: 
"Hi Professor, I've created two practical demonstrations of LibreChat that showcase different ways to use AI in educational settings. Both demos use completely free API keys from Google and Groq, so there's no cost involved in testing them."

**Screen Actions**:
- Show repository structure
- Highlight the two demo folders
- Point out the documentation

---

## Demo 1: Multi-Model Comparison Platform (4 minutes)

### Setup Overview (45 seconds)
**Screen**: Terminal in demo1-multi-model-comparison folder

**Narration**: 
"The first demo lets you compare responses from different AI models side by side. This is perfect for understanding how different models approach the same problem."

**Screen Actions**:
```bash
cd demo1-multi-model-comparison
ls -la
cat README.md
```

### Quick Setup (30 seconds)
**Screen**: Setting up environment

**Narration**: 
"Setup is straightforward - just copy the environment file and add your free API keys."

**Screen Actions**:
```bash
cp .env.example .env
# Show editing .env file with API keys
docker-compose up -d
```

### LibreChat Interface Tour (45 seconds)
**Screen**: LibreChat running at localhost:3080

**Narration**: 
"Once running, you can see all the available AI models in the dropdown. We have Google's Gemini models and several Llama models from Groq."

**Screen Actions**:
- Show login/signup process
- Navigate to model selector
- Display available models:
  - Google Gemini 1.5 Flash
  - Groq Llama 3.3 70B
  - Groq Llama 3.2 (various sizes)
  - Groq Llama 3.1

### Live Comparison Demo (2 minutes)
**Screen**: Side-by-side model testing

**Narration**: 
"Let me demonstrate the comparison feature with a coding question."

**Screen Actions**:
1. **Test 1 - Code Generation** (45 seconds)
   - Select Gemini 1.5 Flash
   - Ask: "Write a Python function for binary search with error handling"
   - Show response
   - Open new conversation
   - Select Llama 3.3 70B
   - Ask same question
   - Compare responses side by side

2. **Test 2 - Creative Writing** (45 seconds)
   - Switch to Gemini
   - Ask: "Write a short story about a robot learning to paint"
   - Note creative style
   - Switch to Llama 3.1 8B
   - Same prompt
   - Compare creativity and speed

3. **Test 3 - File Upload** (30 seconds)
   - Upload an image
   - Ask for description
   - Show how different models handle vision tasks

**Narration**: 
"As you can see, different models excel at different tasks. Gemini tends to be more creative, while the larger Llama models are excellent for technical accuracy."

---

## Demo 2: Preset-Based Workspace (4 minutes)

### Concept Introduction (30 seconds)
**Screen**: Terminal in demo2-preset-workspace folder

**Narration**: 
"The second demo creates specialized AI assistants for different tasks. Think of it as having a coding expert, creative writer, and data analyst all ready to help."

**Screen Actions**:
```bash
cd ../demo2-preset-workspace
cat README.md
```

### Setup and Launch (30 seconds)
**Screen**: Setting up Demo 2

**Narration**: 
"Setup is similar, but this runs on port 3081 to avoid conflicts."

**Screen Actions**:
```bash
cp .env.example .env
# Show .env editing
docker-compose up -d
# Open localhost:3081
```

### Preset System Overview (45 seconds)
**Screen**: LibreChat preset interface

**Narration**: 
"The key feature here is the preset system. Each preset has different settings and instructions optimized for specific tasks."

**Screen Actions**:
- Show preset menu
- Display available presets:
  - Python Developer
  - Creative Writer
  - Data Analyst
  - Code Reviewer
  - Quick Drafts
- Show preset import from JSON file

### Live Preset Demonstrations (2.5 minutes)

**Screen Actions & Narration**:

1. **Python Developer Preset** (30 seconds)
   - Load preset
   - Ask: "Create a FastAPI endpoint for user authentication"
   - **Narration**: "Notice how it follows PEP 8 standards and includes proper error handling"

2. **Creative Writer Preset** (30 seconds)
   - Switch preset
   - Ask: "Describe a sunset over a cyberpunk city"
   - **Narration**: "The temperature is set higher for creativity, giving much more vivid descriptions"

3. **Code Reviewer Preset** (30 seconds)
   - Load preset
   - Paste code with intentional bugs
   - **Narration**: "This preset is configured for systematic analysis and gives detailed feedback"

4. **Data Analyst Preset** (30 seconds)
   - Switch preset
   - Ask: "How should I analyze customer churn data?"
   - **Narration**: "It suggests statistical methods and visualization techniques"

5. **Quick Drafts Preset** (30 seconds)
   - Load preset
   - Ask: "Draft an email about project delays"
   - **Narration**: "This uses the fastest model for quick brainstorming and drafts"

6. **Advanced Features** (30 seconds)
   - Show conversation search
   - Demonstrate export functionality
   - Show parameter differences between presets

---

## Educational Value & Conclusion (1.5 minutes)

### Why These Demos Matter (45 seconds)
**Screen**: Split screen showing both demos

**Narration**: 
"These demos showcase two important educational applications. The comparison platform helps students understand AI model differences and choose the right tool for their needs. The preset workspace provides consistent, specialized assistance for different academic tasks."

### Practical Applications (30 seconds)
**Screen**: Documentation overview

**Narration**: 
"Students can use these for coding assignments, essay writing, data analysis projects, and code reviews. The preset system ensures consistent quality and appropriate responses for each task type."

### Setup Simplicity (15 seconds)
**Screen**: Setup scripts and documentation

**Narration**: 
"Everything is documented with simple setup guides, and both demos use completely free API tiers, making them accessible for any educational environment."

---

## Screen Studio Recording Tips

### Camera Movements
- **Smooth transitions** between terminal and browser
- **Zoom in** on important UI elements (model selectors, preset menus)
- **Highlight** key differences in AI responses
- **Use callouts** for API keys and configuration steps

### Visual Elements
- **Arrows** pointing to model differences
- **Highlights** on important response sections
- **Text overlays** for key concepts
- **Split screen** for side-by-side comparisons

### Pacing
- **Pause** after each AI response to let viewers read
- **Slow down** during setup steps
- **Speed up** during repetitive actions
- **Emphasize** the educational value throughout

### Audio Notes
- **Clear pronunciation** of technical terms
- **Enthusiastic tone** when showing impressive features
- **Professional delivery** appropriate for academic setting
- **Pause for emphasis** on key educational benefits

---

## Post-Recording Checklist

- [ ] Verify all API keys are blurred/hidden
- [ ] Check that both demos run successfully
- [ ] Ensure educational value is clearly communicated
- [ ] Confirm setup instructions are easy to follow
- [ ] Validate that free tier limitations are mentioned
- [ ] Review for any technical errors or unclear explanations

---

## Additional Resources to Mention

- **GitHub Repository**: https://github.com/ani-sivaa/librechat-demos
- **Free API Keys**: Google AI Studio & Groq Console
- **Documentation**: Comprehensive setup guides included
- **Support**: Troubleshooting guide for common issues
- **Extensibility**: Easy to add more models or presets

This video demonstrates practical, cost-effective AI integration for educational environments with real-world applications that students and faculty can immediately use and benefit from.
