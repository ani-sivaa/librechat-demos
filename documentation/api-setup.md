# Getting Your Free API Keys

## Why Do You Need API Keys?

Think of API keys like passwords that let LibreChat talk to Google and Groq's AI services. Both companies give you free access to their AI models - you just need to sign up and get your keys.

## Getting a Google Gemini Key (Totally Free)

### The Easy Way
1. Go to https://makersuite.google.com/app/apikey in your browser
2. Sign in with any Google account (your Gmail works fine)
3. Click the big "Create API Key" button
4. Google will show you a long string of letters and numbers - copy this!
5. Paste it somewhere safe (like a notes app)

### What You Get for Free
- 15 questions per minute (that's plenty for testing)
- 1 million "tokens" per day (tokens are like words - this is a lot)
- No credit card needed at all

## Getting a Groq Key (Also Free)

### The Steps
1. Go to https://console.groq.com
2. Click "Sign Up" and make a free account with any email
3. Check your email and click the verification link
4. Once you're logged in, look for "API Keys" in the menu
5. Click "Create API Key" and give it any name you want
6. Copy the key they give you

### What You Get for Free
- 30 questions per minute (even more than Google!)
- 6,000 tokens per minute
- Access to several different Llama models

## Keeping Your Keys Safe

### Important Rules
1. Don't share your keys with anyone (treat them like passwords)
2. Don't post them online or in public places
3. If you think someone got your key, you can always make a new one
4. Check your usage on the Google and Groq websites to make sure everything looks normal

### Where to Put Your Keys
In your `.env` file, you'll see lines that look like this:
```
GEMINI_API_KEY=paste_your_google_key_here
GROQ_API_KEY=paste_your_groq_key_here
```
Just replace the placeholder text with your actual keys.

## What If You Hit the Limits?

### Google Gemini
- If you ask too many questions too fast, you'll get an error
- Just wait a minute and try again
- The daily limit is huge, so you probably won't hit it

### Groq
- Similar deal - if you go too fast, just slow down
- Different models have different limits, but they're all pretty generous

## If Something Goes Wrong

### Your Key Doesn't Work
- Make sure you copied the whole thing (they're long!)
- Check for extra spaces at the beginning or end
- Try making a new key if the old one seems broken

### Getting "Rate Limited" Errors
- This just means you're asking questions too fast
- Wait 30-60 seconds and try again
- Space out your requests a bit more

### Models Don't Show Up
- Double-check your key is in the right place in the .env file
- Make sure you saved the .env file after editing it
- Try restarting LibreChat (run `docker-compose restart`)

### Still Stuck?
Check the troubleshooting guide or look at the logs by running `docker-compose logs` to see what's happening.
