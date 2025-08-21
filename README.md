# LibreChat Demo Repository

## What's This About?
I've set up two different ways to use LibreChat that show off what it can do. Both demos use completely free AI models from Google and Groq, so you won't spend any money trying them out.

## Demo 1: Compare Different AI Models
Ever wonder which AI gives better answers? This demo lets you ask the same question to different AI models and see how they respond. It's like having multiple AI assistants and seeing who does the best job.

### What You Can Do:
- Try the same question with different AI models (Google's Gemini and various Llama models)
- Switch between models with just a click
- See all the responses side by side to compare them
- Save your conversations to look at later
- Upload images or PDF files and ask questions about them

### Why This Is Useful:
- Figure out which AI is best for different types of questions
- See how different models think about the same problem
- Test which one gives you the most helpful answers
- Great for learning about how different AIs work

## Demo 2: Specialized AI Assistants
This one sets up different AI "personalities" that are good at specific jobs. Think of it like having a coding expert, a creative writer, and a data analyst all ready to help you.

### What You Get:
- Ready-made AI assistants for different tasks (coding, writing, analysis, etc.)
- Each one talks and thinks differently based on what they're supposed to do
- Settings are already tuned for the best results
- Easy to switch between different assistants
- Search through your old conversations

### Why This Is Helpful:
- Get consistent help for specific types of work
- No need to explain what you want every time
- Each assistant is optimized for their specialty
- Perfect for teams that need standardized responses

## How to Get Started

### What You Need First
- Docker installed on your computer (it's free software that runs the demos)
- Two free API keys (think of them as passwords that let you use the AI models)

### Setting Everything Up
```bash
# Download this repository to your computer
git clone https://github.com/ani-sivaa/librechat-demos.git
cd librechat-demos

# Pick which demo you want to try
cd demo1-multi-model-comparison
# or if you prefer the second demo
cd demo2-preset-workspace

# Copy the settings file and add your API keys
cp .env.example .env
nano .env

# Start everything up (this might take a minute)
docker-compose up -d

# Open your web browser and go to http://localhost:3080
```

## Getting Your Free API Keys

### Google Gemini Key (Completely Free)
1. Go to https://makersuite.google.com/app/apikey
2. Sign in with any Google account
3. Click "Create API Key"
4. Copy the long string of letters and numbers

### Groq Key (Also Free)
1. Go to https://console.groq.com
2. Make a free account
3. Look for "API Keys" in the menu
4. Create a new key and copy it

## Which Demo Should You Try?

| What It Does | Demo 1 (Comparison) | Demo 2 (Presets) |
|--------------|-------------------|------------------|
| Multiple AI models | Yes | Yes |
| Compare responses side-by-side | Yes | No |
| Specialized assistants | No | Yes |
| Customization level | Basic | Advanced |
| Upload files | Yes | Yes |
| Save conversations | Yes | Yes |
| Best if you want to... | Test different AIs | Get consistent help |

## Need Help?
- [How to Configure Things](documentation/configuration-guide.md)
- [API Key Setup Details](documentation/api-setup.md)
- [Fix Common Problems](documentation/troubleshooting.md)

## More Info
- Official LibreChat website: https://www.librechat.ai/
- Report problems: [Create Issue](issues)

## Legal Stuff
This is open source software (MIT License) - you can use it however you want.
