# Setting Up Demo 1 (Step by Step)

## What You Need Before Starting
- Docker installed on your computer (if you don't have it, download from docker.com)
- About 10 minutes of your time
- Two free accounts (Google and Groq)

## Step 1: Get Your Free API Keys

### Getting a Google Gemini Key
1. Open your web browser and go to https://makersuite.google.com/app/apikey
2. Sign in with any Google account (Gmail, etc.)
3. You'll see a button that says "Create API Key" - click it
4. Google will generate a long string of letters and numbers - copy this somewhere safe

### Getting a Groq Key
1. Go to https://console.groq.com in your browser
2. Click "Sign Up" and make a free account (use any email)
3. Once you're logged in, look for "API Keys" in the menu
4. Click "Create API Key" 
5. Copy the key they give you (another long string of characters)

## Step 2: Set Up Your Environment
1. Open a terminal or command prompt
2. Go to the demo folder: `cd demo1-multi-model-comparison`
3. Copy the example settings file: `cp .env.example .env`
4. Open the `.env` file in any text editor (Notepad, TextEdit, etc.)
5. Find these two lines and replace the placeholder text with your actual keys:
   ```
   GEMINI_API_KEY=paste_your_google_key_here
   GROQ_API_KEY=paste_your_groq_key_here
   ```
6. Save the file

## Step 3: Start Everything Up
1. In your terminal, run: `docker-compose up -d`
2. Wait about 30 seconds for everything to start (you'll see some text scrolling by)
3. Open your web browser and go to http://localhost:3080

## Step 4: Create Your Account
1. You'll see a login page - click "Sign Up"
2. Pick any email and password (this is just for your local setup)
3. Click "Sign In" to enter the chat interface

## Step 5: Try Comparing Models
1. Look for a dropdown menu that lets you pick different AI models
2. Ask the same question to different models
3. Open new conversations to test different models with the same prompt
4. Try the example questions from the `test-conversations/sample-prompts.json` file

## If Something Goes Wrong

### Docker Won't Start
- Make sure Docker is actually running on your computer
- Try running `docker-compose logs` to see what's happening
- Sometimes you need to wait a bit longer for everything to start up

### AI Models Don't Work
- Double-check that you copied your API keys correctly (no extra spaces)
- Make sure you're using the right keys in the right places
- Try refreshing the webpage

### Getting Rate Limited
- The free tiers have limits on how many questions you can ask
- If you hit the limit, just wait a few minutes and try again
- Groq especially has strict limits, so space out your requests

### Still Having Problems?
Check out the troubleshooting guide in the documentation folder for more detailed help.
