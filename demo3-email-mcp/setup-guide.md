# Setup Guide: Email Assistant Demo

## Quick Start (5 minutes)

### 1. Get Your Gmail App Password
- Go to [Google Account Security](https://myaccount.google.com/security)
- Enable 2-factor authentication if not already enabled
- Generate an App Password:
  - Go to "2-Step Verification" → "App passwords"
  - Select "Mail" → Generate
  - Copy the 16-character password

### 2. Configure Your Environment
```bash
cp .env.example .env
```

Edit the `.env` file with:
```
GEMINI_API_KEY=your_gemini_api_key_here
EMAIL_USER=your.email@gmail.com
EMAIL_PASSWORD=your_16_character_app_password
```

### 3. Start the Demo
```bash
# Install MCP dependencies
cd mcp-server && npm install && cd ..

# Start LibreChat with email capabilities
docker-compose up -d
```

### 4. Test It
- Open http://localhost:3080
- Create account and login
- Ask: "Can you verify my email setup?"
- Try: "Send a test email to yourself@gmail.com"

## API Key Setup

### Google Gemini (Free)
1. Go to https://makersuite.google.com/app/apikey
2. Sign in with your Google account
3. Create API key (completely free)
4. Copy the key to your `.env` file
5. Free tier includes generous daily limits

## Email Service Configuration

### Gmail (Recommended)
- Default configuration works out of the box
- Just need your Gmail address and App Password
- Most reliable for this demo

### Yahoo Mail
Update your `.env`:
```
EMAIL_SERVICE=yahoo
EMAIL_USER=your.email@yahoo.com
EMAIL_PASSWORD=your_yahoo_app_password
```

### Outlook/Hotmail
Update your `.env`:
```
EMAIL_SERVICE=hotmail
EMAIL_USER=your.email@outlook.com
EMAIL_PASSWORD=your_outlook_password
```

## Troubleshooting Common Issues

### "Email transporter not configured"
- Check your EMAIL_USER and EMAIL_PASSWORD in .env
- Make sure you're using an App Password, not your regular password
- Verify 2-factor authentication is enabled

### "SMTP Authentication Failed"
- Double-check your App Password is correct
- Try regenerating a new App Password
- Make sure EMAIL_USER matches exactly (including @gmail.com)

### "Connection timeout"
- Check your internet connection
- Try restarting the containers: `docker-compose restart`
- Verify Gmail isn't blocking the connection

### MCP Server Not Starting
```bash
# Check MCP server dependencies
cd mcp-server
npm install
cd ..

# Check Docker logs
docker-compose logs api
```

## Advanced Configuration

### Custom SMTP Server
Edit `mcp-server/index.js` to add custom SMTP settings:
```javascript
transporter = nodemailer.createTransporter({
  host: 'your-smtp-server.com',
  port: 587,
  secure: false,
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASSWORD,
  },
});
```

### Security Best Practices
- Use App Passwords instead of regular passwords
- Keep your .env file private (never commit to git)
- Consider using environment-specific configurations
- Regularly rotate your API keys and App Passwords

## Testing Your Setup

### Basic Verification
1. "Check if my email is configured correctly"
2. "Send a test email to myself"

### Advanced Testing
1. "Send an email with CC and BCC"
2. "Compose a professional email and send it"
3. "Help me write and send a follow-up email"

## Performance Tips
- Gemini 1.5 Flash is very fast for email composition
- Use gemini-1.5-flash-8b for quick responses
- Use gemini-1.5-flash for more detailed email writing
- Both models are completely free with generous limits