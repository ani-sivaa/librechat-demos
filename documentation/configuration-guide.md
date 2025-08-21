# Configuration Guide

## Understanding librechat.yaml

The librechat.yaml file is the core configuration for LibreChat. It defines:

1. **Endpoints**: AI model configurations
2. **Models**: Available models per endpoint
3. **Parameters**: Default settings
4. **File Handling**: Upload limits and types
5. **Interface**: UI features to enable

## Key Configuration Options

### Custom Endpoints
```yaml
endpoints:
  custom:
    - name: "Display Name"
      apiKey: "${ENV_VARIABLE}"
      baseURL: "API endpoint URL"
      models:
        default: ["model-1", "model-2"]
```

### Model Parameters
- `temperature`: Controls randomness (0.0-1.0)
- `top_p`: Nucleus sampling threshold
- `max_tokens`: Maximum response length
- `presence_penalty`: Reduces repetition
- `frequency_penalty`: Reduces common phrases

### File Configuration
```yaml
fileConfig:
  endpoints:
    custom:
      fileLimit: 10       # Max files per message
      fileSizeLimit: 20   # Max size per file (MB)
      totalSizeLimit: 100 # Total size limit (MB)
```

## Environment Variables

Required variables in .env:
- `GEMINI_API_KEY`: Google AI Studio key
- `GROQ_API_KEY`: Groq platform key
- `MONGO_URI`: MongoDB connection string
- `JWT_SECRET`: Authentication secret
- `CREDS_KEY`: Encryption key (32 chars)
- `CREDS_IV`: Initialization vector (16 chars)

## Best Practices

1. **Security**: Never commit .env files
2. **Keys**: Use strong, unique secrets
3. **Models**: Start with lower-cost models
4. **Limits**: Set appropriate file limits
5. **Monitoring**: Enable debug logging initially
