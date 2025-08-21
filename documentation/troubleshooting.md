# Troubleshooting Guide

## Common Issues

### 1. LibreChat Won't Start
```bash
# Check logs
docker-compose logs

# Restart services
docker-compose restart

# Full reset
docker-compose down
docker-compose up -d
```

### 2. API Key Errors
- Verify keys in .env file
- Check key format (no extra spaces)
- Ensure keys have proper permissions
- Test keys directly with curl

### 3. MongoDB Connection Failed
```bash
# Check MongoDB status
docker ps | grep mongodb

# View MongoDB logs
docker logs chat-mongodb

# Reset MongoDB
docker-compose down -v
docker-compose up -d
```

### 4. Rate Limiting
- Groq has strict rate limits on free tier
- Space out requests
- Use different models to distribute load
- Consider implementing retry logic

### 5. Model Not Available
- Check model name spelling
- Verify model is available in your region
- Some models require waitlist access

### 6. File Upload Issues
- Check file size limits
- Verify MIME types are supported
- Ensure sufficient disk space
- Check Docker volume permissions

### 7. Port Conflicts
- Demo 1 uses port 3080
- Demo 2 uses port 3081
- Check if ports are already in use:
```bash
netstat -tulpn | grep :3080
```

### 8. Docker Issues
```bash
# Check Docker status
docker --version
docker-compose --version

# Free up space
docker system prune

# Reset everything
docker-compose down -v
docker system prune -a
```

## Debug Commands

```bash
# View all logs
docker-compose logs -f

# Check container status
docker ps -a

# Inspect network
docker network ls

# Clean up everything
docker system prune -a

# Check API health
curl http://localhost:3080/health
```

## Performance Issues

### Slow Responses
1. Check internet connection
2. Verify API service status
3. Try different models
4. Check rate limiting

### High Memory Usage
1. Monitor Docker stats: `docker stats`
2. Increase Docker memory limits
3. Restart containers periodically

## Getting Help

1. Check LibreChat documentation: https://www.librechat.ai/
2. Search GitHub issues
3. Ask in Discord community
4. Review configuration carefully

## Environment-Specific Issues

### Windows
- Use WSL2 for better Docker performance
- Check file path formats
- Verify line endings (LF vs CRLF)

### macOS
- Ensure Docker Desktop is running
- Check file sharing permissions
- Verify sufficient disk space

### Linux
- Check Docker daemon status
- Verify user permissions
- Ensure ports are not blocked by firewall
