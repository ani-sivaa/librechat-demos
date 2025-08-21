# Demo 1: AI Model Comparison

## What This Demo Does
Have you ever wondered which AI gives the best answers? This demo lets you ask the same question to different AI models and see how they respond. It's like having a conversation with multiple AI assistants at once and seeing who gives you the most helpful answer.

## What You Can Do
- Ask questions to different AI models (Google's and Meta's models)
- Switch between models with a simple dropdown menu
- Compare answers side by side to see the differences
- Save your conversations to review later
- Upload pictures or PDF files and ask questions about them

## The AI Models You Can Try
- **Google Gemini 1.5 Flash** - Quick responses, great for everyday questions
- **Google Gemini 1.5 Flash 8B** - Even faster, good for simple tasks
- **Groq Llama 3.3 70B** - Really smart, handles complex problems well
- **Groq Llama 3.2** - Comes in different sizes (bigger = smarter but slower)
- **Groq Llama 3.1** - Good balance of speed and intelligence

## Why You'd Want This
- Find out which AI is best for your specific needs
- See how different AIs "think" about the same problem
- Learn which one gives you the most useful answers
- Perfect for students or researchers studying AI behavior

## How to Get Started
1. Copy the example settings file: `cp .env.example .env`
2. Edit the `.env` file and paste in your API keys
3. Start everything: `docker-compose up -d`
4. Open your browser and go to http://localhost:3080
5. Make an account and start testing different AI models

## Where to Get Your Free Keys
- **Google Gemini**: Go to https://makersuite.google.com/app/apikey (totally free)
- **Groq**: Sign up at https://console.groq.com (free tier gives you plenty to experiment with)

## Try These Sample Questions
Look in the `test-conversations/` folder for example questions that really show off what each AI model is good at. These are great starting points to see the differences between models.
