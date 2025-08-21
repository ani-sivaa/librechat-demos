# Demo 1 Setup Guide

## Prerequisites
- Docker and Docker Compose installed
- Google Gemini API key (free)
- Groq API key (free)

## Step 1: Get API Keys

### Gemini API Key (Free)
1. Go to https://makersuite.google.com/app/apikey
2. Sign in with your Google account
3. Click "Create API Key"
4. Copy the generated key

### Groq API Key (Free)
1. Visit https://console.groq.com
2. Sign up for a free account
3. Navigate to API Keys section
4. Create a new API key
5. Copy the key

## Step 2: Environment Setup
1. Navigate to the demo1-multi-model-comparison directory
2. Copy the environment template:
   ```bash
   cp .env.example .env
   ```
3. Edit the `.env` file and add your API keys:
   ```
   GEMINI_API_KEY=your_gemini_key_here
   GROQ_API_KEY=your_groq_key_here
   ```

## Step 3: Start LibreChat
1. Start the services:
   ```bash
   docker-compose up -d
   ```
2. Wait for all services to start (about 30 seconds)
3. Access LibreChat at http://localhost:3080

## Step 4: Create Account
1. Click "Sign Up" on the login page
2. Create your account with email and password
3. Log in to access the interface

## Step 5: Test Model Comparison
1. Select different models from the endpoint dropdown
2. Try the same prompt with different models
3. Compare the responses and note differences
4. Use the sample prompts from `test-conversations/sample-prompts.json`

## Troubleshooting
- If services don't start, check Docker logs: `docker-compose logs`
- If API calls fail, verify your API keys are correct
- For rate limiting issues, wait a few minutes between requests
- Check the troubleshooting guide in the documentation folder
