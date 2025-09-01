# Demo Script: Email Assistant with MCP Integration

## Demo Overview
This demo showcases LibreChat's MCP (Model Context Protocol) integration with a custom email server, allowing AI to send real emails through your Gmail account.

## Pre-Demo Setup (5 minutes)
1. Have Gmail app password ready
2. Copy .env.example to .env with your credentials
3. Run `docker-compose up -d`
4. Verify services are running at http://localhost:3080

## Demo Flow (10-15 minutes)

### 1. Introduction (2 minutes)
**Say:** "Today I'm going to show you something really cool - an AI that can actually send emails for you. This uses LibreChat with MCP to give the AI real email-sending capabilities."

**Show:** 
- Open LibreChat at http://localhost:3080
- Point out the Gemini model options
- Explain this is using Google's free Gemini API

### 2. Verify Email Setup (2 minutes)
**Type:** "Can you verify that my email setup is working correctly?"

**Expected Response:** AI will use the verify_email_setup tool and confirm Gmail connection

**Say:** "As you can see, the AI has tools available to check email configuration. This is powered by MCP - Model Context Protocol - which lets us extend AI capabilities."

### 3. Send a Simple Email (3 minutes)
**Type:** "Send a test email to [your-email@gmail.com] with subject 'AI Demo Test' and message 'This email was sent by AI during a demo!'"

**Expected Response:** AI will compose and send the email, showing the message ID

**Say:** "The AI just sent a real email! Let me check my inbox..." 
*[Check Gmail to show the received email]*

### 4. Compose a Professional Email (4 minutes)
**Type:** "Help me write a professional email to a client explaining that our project will be delayed by one week due to technical challenges, then send it to demo@example.com"

**Expected Response:** AI will:
- Compose a professional, empathetic email
- Ask for confirmation or suggest edits
- Send the email when approved

**Say:** "Notice how the AI not only sent the email, but helped craft it professionally. It understands context and tone."

### 5. Advanced Email Features (3 minutes)
**Type:** "Send an email to team@company.com, CC manager@company.com, with subject 'Weekly Update' and include a brief project status report"

**Expected Response:** AI will create an email with CC functionality

**Say:** "The AI can handle advanced email features like CC, BCC, and even HTML formatting. This makes it genuinely useful for business workflows."

### 6. Show the Technology (2 minutes)
**Show:** 
- Open the librechat.yaml file
- Point out the MCP configuration section
- Briefly show the mcp-server/index.js file

**Say:** "This is all powered by MCP - Model Context Protocol. The email server runs alongside LibreChat and gives the AI these new capabilities. You can extend this pattern for any external service."

## Key Talking Points
- **MCP Integration**: Show how LibreChat extends AI capabilities
- **Real-World Utility**: This actually sends emails, not just pretends
- **Easy Setup**: Uses free Gmail and Gemini accounts
- **Extensible Pattern**: Template for other MCP integrations
- **Security**: Uses app passwords, keeps credentials local

## Common Questions & Answers

**Q: Is this actually sending real emails?**
A: Yes! Check your sent folder in Gmail - you'll see all the emails the AI sent.

**Q: How secure is this?**
A: Very secure - uses Gmail app passwords, all credentials stay on your machine, and the AI can only send emails (not read them).

**Q: What other services could you connect?**
A: Anything with an API - calendars, databases, file systems, web services, etc. MCP makes it easy to extend AI capabilities.

**Q: Does this work with other email providers?**
A: Yes! The demo includes configuration for Yahoo, Outlook, and custom SMTP servers.

## Fallback Plans
- If email sending fails, show the verification tool instead
- If internet is spotty, pre-send some emails to show in inbox
- If Docker issues, have screenshots ready as backup

## Cleanup
- Stop containers: `docker-compose down`
- Delete any test emails from your inbox
- Reset environment file if needed