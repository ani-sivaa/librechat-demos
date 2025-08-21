# Demo 1: Multi-Model Comparison Platform

## Overview
This demo showcases LibreChat's ability to configure multiple AI models and compare their responses side-by-side. You can test the same prompts across different models to evaluate their strengths for various tasks.

## Features
- Multiple AI model endpoints (Gemini and Groq Llama models)
- Easy model switching in the interface
- Side-by-side response comparison
- Export conversation history for analysis
- File upload support for images and PDFs

## Available Models
- **Google Gemini 1.5 Flash** - Fast responses, good for general tasks
- **Google Gemini 1.5 Flash 8B** - Lightweight version for quick responses
- **Groq Llama 3.3 70B** - Large model for complex reasoning
- **Groq Llama 3.2** - Multiple sizes (90B, 11B, 3B, 1B) for different needs
- **Groq Llama 3.1** - Balanced performance (70B, 8B variants)

## Use Cases
- Model evaluation for specific tasks
- Quality comparison between different AI models
- Performance benchmarking
- Cost-benefit analysis
- Educational demonstrations

## Quick Start
1. Copy `.env.example` to `.env`
2. Add your API keys to the `.env` file
3. Run `docker-compose up -d`
4. Access LibreChat at http://localhost:3080
5. Create an account and start comparing models

## Getting API Keys
- **Gemini**: Visit https://makersuite.google.com/app/apikey (free)
- **Groq**: Visit https://console.groq.com (free tier available)

## Testing Prompts
Check the `test-conversations/` directory for sample prompts designed to showcase different model capabilities.
