# How to Configure LibreChat

## What's the librechat.yaml File?

Think of this file as the "settings" for your LibreChat setup. It tells LibreChat which AI models you want to use and how they should behave. Don't worry - the demos already have this set up for you, but here's what's happening behind the scenes.

## The Main Things This File Controls

### Which AI Models You Can Use
```yaml
endpoints:
  custom:
    - name: "What you'll see in the dropdown"
      apiKey: "${YOUR_API_KEY_NAME}"
      baseURL: "Where to find this AI model"
      models:
        default: ["model-name-1", "model-name-2"]
```

### How the AI Behaves
- `temperature`: How creative vs predictable the AI is (0 = very predictable, 1 = very creative)
- `top_p`: Another creativity setting (usually leave this alone)
- `max_tokens`: How long responses can be
- `presence_penalty`: Stops the AI from repeating itself too much
- `frequency_penalty`: Stops the AI from using the same phrases over and over

### File Upload Settings
```yaml
fileConfig:
  endpoints:
    custom:
      fileLimit: 10       # How many files you can upload at once
      fileSizeLimit: 20   # Biggest file size allowed (in MB)
      totalSizeLimit: 100 # Total size of all files combined
```

## Your Secret Keys (.env file)

These are the "passwords" that let LibreChat talk to the AI services:
- `GEMINI_API_KEY`: Your Google key
- `GROQ_API_KEY`: Your Groq key
- `MONGO_URI`: Database connection (already set up)
- `JWT_SECRET`: Security stuff (already set up)
- `CREDS_KEY`: More security stuff (already set up)
- `CREDS_IV`: Even more security stuff (already set up)

## Things to Remember

1. **Keep your keys secret**: Never share your .env file or post it online
2. **Start simple**: Use the default settings first, then experiment
3. **Free models first**: Stick with the free tiers until you know what you're doing
4. **File limits**: Don't set these too high or you'll run out of space
5. **Turn on logging**: If something breaks, logs help you figure out what went wrong
