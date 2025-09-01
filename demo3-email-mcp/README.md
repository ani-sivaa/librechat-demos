# Demo 3: Email Assistant with MCP

## What This Demo Does
Ever wanted to send emails directly from your AI chat? This demo shows how to use LibreChat with a Model Context Protocol (MCP) server to send real emails through your Gmail account. Just ask the AI to send an email, and it will actually do it!

## What You Can Do
- Ask AI to send emails to anyone from your Gmail account
- Compose emails with AI help and send them immediately  
- Verify your email setup is working correctly
- Send emails with custom subjects, recipients, CC, and BCC
- Use both plain text and HTML formatting in your emails

## How It Works
This demo uses MCP (Model Context Protocol) to give the AI the ability to send emails. The AI can use two main functions:
- **send_email** - Actually sends emails through your Gmail account
- **verify_email_setup** - Checks if your email configuration is working

## Why You'd Want This
- Get AI to help write and send your emails automatically
- Perfect for automating email notifications or reminders
- Great example of how to extend LibreChat with custom functionality
- Learn how MCP servers work with LibreChat

## How to Get Started

### Step 1: Get Your Gmail App Password
1. Go to your Google Account settings
2. Turn on 2-factor authentication if you haven't already
3. Generate an "App Password" for this demo:
   - Go to Security → 2-Step Verification → App passwords
   - Select "Mail" and generate a password
   - Copy this 16-character password (not your regular Gmail password!)

### Step 2: Set Up Your Environment
1. Copy the example settings: `cp .env.example .env`
2. Edit the `.env` file and fill in:
   - Your Gemini API key (free from Google)
   - Your Gmail address in `EMAIL_USER`
   - Your Gmail app password in `EMAIL_PASSWORD`

### Step 3: Install Dependencies and Start
```bash
# Install MCP server dependencies
cd mcp-server
npm install
cd ..

# Start the demo
docker-compose up -d
```

### Step 4: Try It Out
1. Open http://localhost:3080 in your browser
2. Create an account and log in
3. Try asking: "Can you verify my email setup?"
4. Then ask: "Send an email to test@example.com with subject 'Hello from AI' and message 'This email was sent by AI!'"

## Example Commands to Try

**Verify Setup:**
"Check if my email is configured correctly"

**Send Simple Email:**
"Send an email to john@example.com with the subject 'Meeting Tomorrow' and tell them we're meeting at 2pm"

**Send Email with CC:**
"Send an email to team@company.com, CC manager@company.com, with subject 'Project Update' and a brief status report"

**Get Help Writing:**
"Help me write a professional email to a client explaining a delay in delivery, then send it to client@business.com"

## Email Services Supported
- Gmail (default and recommended)
- Yahoo Mail 
- Outlook/Hotmail
- Other SMTP services (requires custom configuration)

## Security Notes
- Uses Gmail App Passwords (more secure than regular passwords)
- Your credentials stay on your computer, never shared with AI providers
- All email sending happens from your own Gmail account
- The AI can only send emails, not read your existing emails

## Troubleshooting
- Make sure you're using an App Password, not your regular Gmail password
- Check that 2-factor authentication is enabled on your Google account
- Verify your EMAIL_USER and EMAIL_PASSWORD are correct in the .env file
- Use the "verify_email_setup" command to test your configuration

## Technical Details
This demo implements an MCP (Model Context Protocol) server that:
- Runs as a Node.js service alongside LibreChat
- Uses nodemailer to send emails via SMTP
- Integrates with LibreChat through the MCP configuration
- Provides secure, sandboxed email capabilities to AI models