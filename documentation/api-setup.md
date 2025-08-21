# API Setup Guide

## Getting Gemini API Key (Free)

### Step 1: Access Google AI Studio
1. Visit https://makersuite.google.com/app/apikey
2. Sign in with your Google account

### Step 2: Create API Key
1. Click "Create API Key"
2. Choose "Create API key in new project" or select existing project
3. Copy the generated API key
4. Store it securely

### Step 3: Verify Access
- Free tier includes 15 requests per minute
- 1 million tokens per day
- No credit card required

## Getting Groq API Key (Free)

### Step 1: Sign Up
1. Visit https://console.groq.com
2. Create a free account
3. Verify your email address

### Step 2: Generate API Key
1. Navigate to API Keys section
2. Click "Create API Key"
3. Give it a descriptive name
4. Copy the generated key

### Step 3: Understand Limits
- Free tier: 30 requests per minute
- 6,000 tokens per minute
- Multiple model options available

## API Key Security

### Best Practices
1. Never commit API keys to version control
2. Use environment variables
3. Rotate keys regularly
4. Monitor usage in respective dashboards

### Environment Setup
```bash
# In your .env file
GEMINI_API_KEY=your_actual_gemini_key_here
GROQ_API_KEY=your_actual_groq_key_here
```

## Rate Limiting

### Gemini Limits
- 15 requests per minute (free tier)
- 1M tokens per day
- Automatic retry with backoff recommended

### Groq Limits
- 30 requests per minute (free tier)
- 6,000 tokens per minute
- Different limits per model

## Troubleshooting API Issues

### Common Problems
1. **Invalid API Key**: Double-check key format
2. **Rate Limiting**: Wait between requests
3. **Model Not Available**: Check model names
4. **Network Issues**: Verify internet connection

### Testing API Keys
```bash
# Test Gemini API
curl -H "Content-Type: application/json" \
     -d '{"contents":[{"parts":[{"text":"Hello"}]}]}' \
     "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=YOUR_KEY"

# Test Groq API
curl -X POST "https://api.groq.com/openai/v1/chat/completions" \
     -H "Authorization: Bearer YOUR_KEY" \
     -H "Content-Type: application/json" \
     -d '{"messages":[{"role":"user","content":"Hello"}],"model":"llama-3.1-8b-instant"}'
```
