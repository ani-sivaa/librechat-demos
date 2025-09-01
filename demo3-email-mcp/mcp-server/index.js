#!/usr/bin/env node

import { Server } from '@modelcontextprotocol/sdk/server/index.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
} from '@modelcontextprotocol/sdk/types.js';
import nodemailer from 'nodemailer';

const server = new Server(
  {
    name: 'email-mcp-server',
    version: '1.0.0',
  },
  {
    capabilities: {
      tools: {},
    },
  }
);

// Create nodemailer transporter
let transporter = null;

function createTransporter() {
  const emailService = process.env.EMAIL_SERVICE || 'gmail';
  const emailUser = process.env.EMAIL_USER;
  const emailPassword = process.env.EMAIL_PASSWORD;

  if (!emailUser || !emailPassword) {
    throw new Error('EMAIL_USER and EMAIL_PASSWORD environment variables are required');
  }

  transporter = nodemailer.createTransporter({
    service: emailService,
    auth: {
      user: emailUser,
      pass: emailPassword,
    },
  });
}

// Initialize transporter
try {
  createTransporter();
} catch (error) {
  console.error('Failed to create email transporter:', error.message);
}

// List available tools
server.setRequestHandler(ListToolsRequestSchema, async () => {
  return {
    tools: [
      {
        name: 'send_email',
        description: 'Send an email to specified recipients',
        inputSchema: {
          type: 'object',
          properties: {
            to: {
              type: 'string',
              description: 'Recipient email address(es), comma-separated for multiple recipients',
            },
            subject: {
              type: 'string',
              description: 'Email subject line',
            },
            text: {
              type: 'string',
              description: 'Plain text content of the email',
            },
            html: {
              type: 'string',
              description: 'HTML content of the email (optional)',
            },
            cc: {
              type: 'string',
              description: 'CC recipients, comma-separated (optional)',
            },
            bcc: {
              type: 'string',
              description: 'BCC recipients, comma-separated (optional)',
            },
          },
          required: ['to', 'subject', 'text'],
        },
      },
      {
        name: 'verify_email_setup',
        description: 'Verify that email configuration is working',
        inputSchema: {
          type: 'object',
          properties: {},
        },
      },
    ],
  };
});

// Handle tool calls
server.setRequestHandler(CallToolRequestSchema, async (request) => {
  const { name, arguments: args } = request.params;

  try {
    switch (name) {
      case 'send_email': {
        if (!transporter) {
          throw new Error('Email transporter not configured. Check your EMAIL_USER and EMAIL_PASSWORD environment variables.');
        }

        const { to, subject, text, html, cc, bcc } = args;

        if (!to || !subject || !text) {
          throw new Error('Missing required parameters: to, subject, and text are required');
        }

        const mailOptions = {
          from: process.env.EMAIL_USER,
          to,
          subject,
          text,
        };

        // Add optional parameters
        if (html) mailOptions.html = html;
        if (cc) mailOptions.cc = cc;
        if (bcc) mailOptions.bcc = bcc;

        const info = await transporter.sendMail(mailOptions);

        return {
          content: [
            {
              type: 'text',
              text: `Email sent successfully! Message ID: ${info.messageId}\nTo: ${to}\nSubject: ${subject}`,
            },
          ],
        };
      }

      case 'verify_email_setup': {
        if (!transporter) {
          return {
            content: [
              {
                type: 'text',
                text: 'Email setup is not configured. Please set EMAIL_USER and EMAIL_PASSWORD environment variables.',
              },
            ],
          };
        }

        try {
          await transporter.verify();
          return {
            content: [
              {
                type: 'text',
                text: `Email setup verified successfully! Using ${process.env.EMAIL_SERVICE || 'gmail'} service with account: ${process.env.EMAIL_USER}`,
              },
            ],
          };
        } catch (error) {
          return {
            content: [
              {
                type: 'text',
                text: `Email setup verification failed: ${error.message}`,
              },
            ],
          };
        }
      }

      default:
        throw new Error(`Unknown tool: ${name}`);
    }
  } catch (error) {
    return {
      content: [
        {
          type: 'text',
          text: `Error: ${error.message}`,
        },
      ],
      isError: true,
    };
  }
});

async function runServer() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error('Email MCP server running on stdio');
}

runServer().catch((error) => {
  console.error('Server error:', error);
  process.exit(1);
});