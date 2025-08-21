# Demo 2: Preset-Based Workspace

## Overview
This demo demonstrates LibreChat's preset system to create specialized AI assistants for different tasks. Each preset has optimized settings and instructions for specific use cases.

## Features
- Pre-configured AI assistants for different roles
- Custom system messages and parameters per preset
- Optimized temperature and token settings
- Quick switching between specialized contexts
- Conversation search and history management
- Import/export preset configurations

## Available Presets
- **Python Developer** - Code generation with PEP 8 standards
- **Creative Writer** - High creativity for storytelling and content
- **Data Analyst** - Statistical analysis and visualization suggestions
- **Code Reviewer** - Systematic code analysis and feedback
- **Quick Drafts** - Fast responses for brainstorming and drafts

## Use Cases
- Role-specific assistance
- Consistent formatting and style
- Task optimization
- Team standardization
- Educational demonstrations

## Quick Start
1. Copy `.env.example` to `.env`
2. Add your API keys to the `.env` file
3. Run `docker-compose up -d`
4. Access LibreChat at http://localhost:3081
5. Load presets and start working with specialized assistants

## Getting API Keys
- **Gemini**: Visit https://makersuite.google.com/app/apikey (free)
- **Groq**: Visit https://console.groq.com (free tier available)

## Preset Configuration
Check the `presets/` directory for preset templates that can be imported into LibreChat for immediate use.
