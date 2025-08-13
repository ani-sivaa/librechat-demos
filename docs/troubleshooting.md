# LibreChat Troubleshooting Guide

## 🎯 Overview

This comprehensive troubleshooting guide helps resolve common issues when running LibreChat for educational assessment with **FREE AI models**.

## 🚨 Quick Diagnostic Commands

Run these first to identify issues:

```bash
# Check service status
docker compose ps

# View recent logs
docker compose logs --tail=50 librechat

# Check system resources
docker stats --no-stream

# Test network connectivity
curl -I http://localhost:3080

# Check disk space
df -h
```

---

## 🔧 Common Issues & Solutions

### 1. LibreChat Won't Start

**Symptoms**:
- Can't access http://localhost:3080
- Container exits immediately
- "Connection refused" errors

**Diagnostic Steps**:
```bash
# Check container status
docker compose ps

# View startup logs
docker compose logs librechat

# Check port conflicts
netstat -tulpn | grep 3080
```

**Solutions**:

**Port Conflict**:
```bash
# Change port in docker-compose.yml
ports:
  - "3081:3080"  # Use different external port

# Or kill conflicting process
sudo lsof -ti:3080 | xargs sudo kill -9
```

**Memory Issues**:
```bash
# Check available memory
free -h

# Increase Docker memory limits
# Edit docker-compose.yml:
services:
  librechat:
    deploy:
      resources:
        limits:
          memory: 2G
```

**Permission Issues**:
```bash
# Fix file permissions
sudo chown -R $USER:$USER .
chmod +x setup-prelab.sh

# Fix Docker permissions
sudo usermod -aG docker $USER
newgrp docker
```

**Configuration Errors**:
```bash
# Validate YAML syntax
docker compose config

# Reset to defaults
cp .env.example .env
docker compose down -v
docker compose up -d
```

---

### 2. AI Models Not Available

**Symptoms**:
- Empty model dropdown
- "No models available" message
- API key errors

**Diagnostic Steps**:
```bash
# Check API key configuration
grep GOOGLE_KEY .env

# Test Ollama connection
docker compose exec ollama ollama list

# Check model download logs
docker compose logs model-setup
```

**Solutions**:

**Missing API Keys**:
```bash
# Add Gemini API key to .env
echo "GOOGLE_KEY=your_actual_api_key_here" >> .env

# Restart services
docker compose restart librechat
```

**Ollama Models Not Downloaded**:
```bash
# Check available models
docker compose exec ollama ollama list

# Manually download models
docker compose exec ollama ollama pull llama3.2:3b
docker compose exec ollama ollama pull codellama:7b-code

# Check download progress
docker compose logs -f ollama
```

**Invalid API Keys**:
```bash
# Test Gemini API key
curl -H "Authorization: Bearer $GOOGLE_KEY" \
  "https://generativelanguage.googleapis.com/v1/models"

# Get new API key at: https://ai.google.dev/
```

**Model Configuration Issues**:
```bash
# Validate librechat.yaml
docker compose exec librechat cat /app/librechat.yaml

# Reset to default configuration
cp librechat.yaml.backup librechat.yaml
docker compose restart librechat
```

---

### 3. File Upload Problems

**Symptoms**:
- Upload button not working
- "File too large" errors
- Unsupported file type messages

**Diagnostic Steps**:
```bash
# Check file size limits
grep -i filesize librechat.yaml

# Check supported MIME types
grep -A 10 supportedMimeTypes librechat.yaml

# Check disk space
df -h
```

**Solutions**:

**File Size Limits**:
```yaml
# Edit librechat.yaml
fileConfig:
  endpoints:
    google:
      fileSizeLimit: 50  # Increase to 50MB
      totalSizeLimit: 200  # Increase total limit
```

**Unsupported File Types**:
```yaml
# Add MIME types to librechat.yaml
supportedMimeTypes:
  - "application/pdf"
  - "text/plain"
  - "image/jpeg"
  - "image/png"
  - "text/x-python"
  - "application/vnd.ms-excel"  # Add Excel support
  - "text/csv"  # Add CSV support
```

**Storage Issues**:
```bash
# Check Docker volume space
docker system df

# Clean up unused data
docker system prune -f

# Increase volume size if needed
docker volume inspect librechat-demos_mongo_data
```

**Browser Issues**:
```bash
# Clear browser cache
# Try different browser
# Disable browser extensions
# Check browser console for errors (F12)
```

---

### 4. Performance Issues

**Symptoms**:
- Slow response times
- Timeouts
- High CPU/memory usage

**Diagnostic Steps**:
```bash
# Monitor resource usage
docker stats

# Check system load
top
htop

# Monitor network
netstat -i
```

**Solutions**:

**Resource Optimization**:
```yaml
# Edit docker-compose.yml
services:
  librechat:
    deploy:
      resources:
        limits:
          cpus: '2.0'
          memory: 4G
        reservations:
          memory: 2G
```

**Ollama Performance**:
```bash
# Use smaller models for better performance
docker compose exec ollama ollama pull llama3.2:1b  # Smaller model

# Enable GPU acceleration (if available)
# Edit docker-compose.yml:
services:
  ollama:
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
```

**Database Optimization**:
```bash
# Optimize MongoDB
docker compose exec mongo mongo --eval "db.runCommand({compact: 'conversations'})"

# Clear old conversations
docker compose exec mongo mongo librechat --eval "db.conversations.deleteMany({createdAt: {$lt: new Date(Date.now() - 30*24*60*60*1000)}})"
```

**Network Optimization**:
```bash
# Use local DNS
echo "127.0.0.1 localhost" >> /etc/hosts

# Optimize Docker networking
docker network ls
docker network prune
```

---

### 5. Authentication Issues

**Symptoms**:
- Can't create account
- Login failures
- Session timeouts

**Diagnostic Steps**:
```bash
# Check authentication logs
docker compose logs librechat | grep -i auth

# Verify JWT secrets
grep JWT_SECRET .env

# Check user registration settings
grep ALLOW_REGISTRATION .env
```

**Solutions**:

**Registration Disabled**:
```bash
# Enable registration in .env
ALLOW_REGISTRATION=true

# Restart LibreChat
docker compose restart librechat
```

**JWT Secret Issues**:
```bash
# Generate new JWT secrets
JWT_SECRET=$(openssl rand -base64 32)
SESSION_SECRET=$(openssl rand -base64 32)

# Update .env file
echo "JWT_SECRET=$JWT_SECRET" >> .env
echo "SESSION_SECRET=$SESSION_SECRET" >> .env
```

**Database Connection Issues**:
```bash
# Check MongoDB connection
docker compose exec mongo mongo --eval "db.stats()"

# Reset user database
docker compose exec mongo mongo librechat --eval "db.users.drop()"
```

**Social Login Issues**:
```bash
# Check OAuth configuration
grep -E "(GITHUB|GOOGLE)_CLIENT" .env

# Verify callback URLs in OAuth apps
# GitHub: http://localhost:3080/oauth/github/callback
# Google: http://localhost:3080/oauth/google/callback
```

---

### 6. Docker Issues

**Symptoms**:
- Containers won't start
- Image pull failures
- Volume mount errors

**Diagnostic Steps**:
```bash
# Check Docker daemon
sudo systemctl status docker

# Check Docker version
docker --version
docker compose --version

# Check available space
docker system df
```

**Solutions**:

**Docker Daemon Issues**:
```bash
# Restart Docker daemon
sudo systemctl restart docker

# Check Docker logs
sudo journalctl -u docker.service
```

**Image Pull Failures**:
```bash
# Pull images manually
docker pull ghcr.io/danny-avila/librechat-dev:latest
docker pull mongo:7
docker pull redis:7-alpine
docker pull ollama/ollama:latest

# Use different registry if needed
# Edit docker-compose.yml to use docker.io instead of ghcr.io
```

**Volume Issues**:
```bash
# Check volume permissions
ls -la /var/lib/docker/volumes/

# Recreate volumes
docker compose down -v
docker volume prune
docker compose up -d
```

**Network Issues**:
```bash
# Reset Docker networks
docker network prune

# Create custom network
docker network create librechat-network
```

---

### 7. Configuration Issues

**Symptoms**:
- Features not working
- Incorrect model behavior
- Missing functionality

**Diagnostic Steps**:
```bash
# Validate configuration files
docker compose config
yamllint librechat.yaml

# Check environment variables
docker compose exec librechat env | grep -E "(GOOGLE|OLLAMA|GROQ)"
```

**Solutions**:

**YAML Syntax Errors**:
```bash
# Validate YAML syntax
python3 -c "import yaml; yaml.safe_load(open('librechat.yaml'))"

# Use online YAML validator
# Fix indentation and syntax errors
```

**Environment Variable Issues**:
```bash
# Check .env file format
cat .env | grep -v "^#" | grep "="

# Remove Windows line endings
dos2unix .env

# Escape special characters
# Use quotes for values with spaces or special chars
```

**Feature Configuration**:
```yaml
# Enable all educational features in librechat.yaml
artifacts: true
codeInterpreter: true
speech:
  tts: true
  stt: true
```

---

## 🔍 Advanced Debugging

### Log Analysis

**Comprehensive Log Collection**:
```bash
# Collect all logs
mkdir -p debug-logs
docker compose logs > debug-logs/all-services.log
docker compose logs librechat > debug-logs/librechat.log
docker compose logs ollama > debug-logs/ollama.log
docker compose logs mongo > debug-logs/mongo.log

# System information
uname -a > debug-logs/system-info.txt
docker --version >> debug-logs/system-info.txt
free -h >> debug-logs/system-info.txt
df -h >> debug-logs/system-info.txt
```

**Error Pattern Analysis**:
```bash
# Find common errors
grep -i error debug-logs/librechat.log | sort | uniq -c

# Check for memory issues
grep -i "out of memory\|oom" debug-logs/all-services.log

# Look for network issues
grep -i "connection\|timeout\|refused" debug-logs/all-services.log
```

### Performance Profiling

**Resource Monitoring**:
```bash
# Continuous monitoring
watch -n 5 'docker stats --no-stream'

# Memory usage over time
while true; do
  echo "$(date): $(docker stats --no-stream --format 'table {{.Container}}\t{{.MemUsage}}')"
  sleep 60
done > memory-usage.log
```

**Database Performance**:
```bash
# MongoDB performance stats
docker compose exec mongo mongo librechat --eval "db.stats()"
docker compose exec mongo mongo librechat --eval "db.conversations.stats()"

# Check slow queries
docker compose exec mongo mongo librechat --eval "db.setProfilingLevel(2)"
```

### Network Debugging

**Connection Testing**:
```bash
# Test internal connectivity
docker compose exec librechat curl -I http://mongo:27017
docker compose exec librechat curl -I http://redis:6379
docker compose exec librechat curl -I http://ollama:11434

# Test external connectivity
docker compose exec librechat curl -I https://api.openai.com
docker compose exec librechat curl -I https://generativelanguage.googleapis.com
```

**DNS Resolution**:
```bash
# Check DNS resolution
docker compose exec librechat nslookup mongo
docker compose exec librechat nslookup ollama

# Test with IP addresses if DNS fails
docker inspect librechat-demos_mongo_1 | grep IPAddress
```

---

## 🆘 Emergency Recovery

### Complete Reset

**Nuclear Option** (loses all data):
```bash
# Stop everything
docker compose down -v

# Remove all containers and images
docker system prune -a -f

# Remove all volumes
docker volume prune -f

# Start fresh
docker compose up -d
```

### Backup and Restore

**Create Backup**:
```bash
# Backup configuration
tar -czf librechat-backup-$(date +%Y%m%d).tar.gz \
  .env librechat.yaml docker-compose.yml

# Backup database
docker compose exec mongo mongodump --out /tmp/backup
docker cp $(docker compose ps -q mongo):/tmp/backup ./mongo-backup

# Backup Ollama models
docker compose exec ollama tar -czf /tmp/ollama-backup.tar.gz /root/.ollama
docker cp $(docker compose ps -q ollama):/tmp/ollama-backup.tar.gz ./
```

**Restore from Backup**:
```bash
# Restore configuration
tar -xzf librechat-backup-YYYYMMDD.tar.gz

# Restore database
docker cp ./mongo-backup $(docker compose ps -q mongo):/tmp/
docker compose exec mongo mongorestore /tmp/mongo-backup

# Restore Ollama models
docker cp ./ollama-backup.tar.gz $(docker compose ps -q ollama):/tmp/
docker compose exec ollama tar -xzf /tmp/ollama-backup.tar.gz -C /
```

---

## 📞 Getting Help

### Self-Help Resources

1. **Check logs first**: `docker compose logs`
2. **Search this guide** for your specific error
3. **Try safe restart**: `docker compose restart`
4. **Check system resources**: `docker stats`
5. **Validate configuration**: `docker compose config`

### Community Support

**GitHub Issues**:
- Search existing issues: https://github.com/danny-avila/LibreChat/issues
- Create new issue with logs and system info
- Use issue templates for bug reports

**Documentation**:
- Official docs: https://www.librechat.ai/docs
- Educational guides in this repository
- Community wiki and tutorials

**Discussion Forums**:
- GitHub Discussions for general questions
- Discord community for real-time help
- Reddit communities for educational AI

### Professional Support

**For Educational Institutions**:
- Consider professional deployment services
- Institutional support contracts available
- Custom configuration and training services

---

## 📋 Troubleshooting Checklist

Before asking for help, verify:

- [ ] **System meets minimum requirements** (8GB RAM, 50GB disk)
- [ ] **Docker and Docker Compose** are properly installed
- [ ] **All services are running**: `docker compose ps`
- [ ] **No port conflicts** on 3080, 27017, 6379, 11434
- [ ] **API keys are valid** and properly configured
- [ ] **Configuration files** have correct syntax
- [ ] **Sufficient disk space** available
- [ ] **Network connectivity** to external services
- [ ] **Logs reviewed** for specific error messages
- [ ] **Basic restart attempted**: `docker compose restart`

## 🎯 Prevention Tips

**Regular Maintenance**:
```bash
# Weekly cleanup
docker system prune -f

# Monthly backup
./backup-script.sh

# Update images
docker compose pull
docker compose up -d
```

**Monitoring Setup**:
```bash
# Set up log rotation
echo "*/5 * * * * docker system prune -f" | crontab -

# Monitor disk space
echo "0 */6 * * * df -h | mail -s 'Disk Space Report' admin@yourdomain.com" | crontab -
```

**Configuration Management**:
- Keep backup copies of working configurations
- Document any custom changes
- Test changes in development environment first
- Use version control for configuration files

---

**Remember**: Most issues can be resolved with a simple restart or configuration fix. When in doubt, check the logs first! 🔧✨
