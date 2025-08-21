# Setting Up Demo 2 (Your AI Team)

## What You Need Before Starting
- Docker installed on your computer (get it from docker.com if you don't have it)
- About 10 minutes to set everything up
- Two free accounts (Google and Groq)

## Step 1: Get Your Free API Keys

### Getting a Google Gemini Key
1. Go to https://makersuite.google.com/app/apikey in your browser
2. Sign in with any Google account you have
3. Click "Create API Key" 
4. Copy the long string of characters they give you

### Getting a Groq Key
1. Visit https://console.groq.com
2. Make a free account with any email address
3. Look for "API Keys" in the menu once you're logged in
4. Click "Create API Key" and give it any name
5. Copy the key they generate for you

## Step 2: Set Up Your Environment
1. Open a terminal and go to the demo2 folder: `cd demo2-preset-workspace`
2. Copy the example settings: `cp .env.example .env`
3. Open the `.env` file in any text editor
4. Find these lines and replace the placeholder text with your actual keys:
   ```
   GEMINI_API_KEY=paste_your_google_key_here
   GROQ_API_KEY=paste_your_groq_key_here
   ```
5. Save the file

## Step 3: Start Your AI Team
1. In your terminal, run: `docker-compose up -d`
2. Wait about 30 seconds for everything to start up
3. Open your browser and go to http://localhost:3081 (notice this uses port 3081, not 3080!)

## Step 4: Create Your Account
1. You'll see a login page - click "Sign Up"
2. Make an account with any email and password (this is just for your local setup)
3. Sign in to get to the main interface

## Step 5: Load Your AI Assistants
1. Look for a "Presets" section in the LibreChat interface
2. Import the ready-made assistants from the `presets/preset-templates.json` file
3. Or you can manually set up each assistant using the configurations provided

## Step 6: Try Out Your AI Team
1. Load the "Python Developer" assistant and ask it to write some code
2. Notice how it writes clean, professional code with good comments
3. Switch to the "Creative Writer" assistant and ask for a short story
4. See how it uses much more creative and descriptive language
5. Try the other assistants to see how each one has its own specialty

## If Something Goes Wrong

### Docker Won't Start
- Make sure Docker is running on your computer
- Try `docker-compose logs` to see what's happening
- Sometimes it just takes longer to start up - be patient

### AI Assistants Don't Work
- Double-check that you copied your API keys correctly
- Make sure there are no extra spaces in your keys
- Try refreshing the webpage

### Can't Import Presets
- Make sure the JSON file isn't corrupted (it should look like valid JSON)
- Try importing them one at a time instead of all at once
- You can always create the presets manually if the import doesn't work

### Port Already in Use
- If port 3081 is already being used, you can change it in the docker-compose.yml file
- Or stop whatever else is using that port

### Still Having Issues?
Check the troubleshooting guide in the documentation folder for more detailed help, or look at the logs to see what's going wrong.
