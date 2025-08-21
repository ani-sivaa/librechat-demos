# When Things Go Wrong

## The Most Common Problems

### LibreChat Won't Start Up
If LibreChat isn't starting, try these steps:
```bash
# See what's happening
docker-compose logs

# Try restarting everything
docker-compose restart

# If that doesn't work, start fresh
docker-compose down
docker-compose up -d
```

### Your API Keys Aren't Working
- Double-check that you copied your keys correctly into the .env file
- Make sure there are no extra spaces before or after your keys
- Try creating new keys if the old ones seem broken
- Test your keys on the Google/Groq websites to make sure they work

### Database Problems
If you're getting database errors, try this:
```bash
# Check if the database is running
docker ps | grep mongodb

# Look at what the database is saying
docker logs chat-mongodb

# Reset the database (this will delete your conversations)
docker-compose down -v
docker-compose up -d
```

### Getting "Too Many Requests" Errors
- Both Google and Groq limit how fast you can ask questions
- If you hit the limit, just wait a minute and try again
- Try using different models to spread out your requests
- Don't spam the AI with lots of questions at once

### AI Models Don't Show Up
- Check that you spelled the model names correctly in your config
- Some models might not be available in your country
- A few models require special access (but the free ones should work)

### Can't Upload Files
- Check if your files are too big (there are size limits)
- Make sure you're uploading supported file types (images, PDFs, text)
- You might be running out of disk space
- Try restarting LibreChat if uploads suddenly stop working

### Port Already in Use
- Demo 1 runs on port 3080, Demo 2 runs on port 3081
- If you get a "port already in use" error, something else is using that port
- You can check what's using a port like this: `netstat -tulpn | grep :3080`
- Either stop the other program or change the port in docker-compose.yml

### Docker Problems
If Docker itself is having issues:
```bash
# Make sure Docker is working
docker --version
docker-compose --version

# Clean up old Docker stuff to free space
docker system prune

# Nuclear option - reset everything (you'll lose your conversations)
docker-compose down -v
docker system prune -a
```

## Useful Commands for Debugging

```bash
# See what's happening in real-time
docker-compose logs -f

# Check if all containers are running
docker ps -a

# See Docker networks
docker network ls

# Clean up everything
docker system prune -a

# Test if LibreChat is responding
curl http://localhost:3080/health
```

## When Everything is Slow

### AI Responses Take Forever
1. Check your internet connection
2. Try a different AI model (some are faster than others)
3. You might be hitting rate limits - slow down your requests
4. Check if the AI service is having problems (Google/Groq status pages)

### Computer Running Out of Memory
1. See how much memory Docker is using: `docker stats`
2. Give Docker more memory in Docker Desktop settings
3. Restart the containers every once in a while to clear memory

## Where to Get More Help

1. Check the official LibreChat docs: https://www.librechat.ai/
2. Look through GitHub issues to see if someone else had the same problem
3. Join the LibreChat Discord community for help
4. Go through your configuration files carefully to spot any mistakes

## Problems on Different Operating Systems

### Windows Users
- Use WSL2 if you can - it makes Docker work much better
- Watch out for weird file path issues
- Sometimes Windows messes up line endings in text files

### Mac Users
- Make sure Docker Desktop is actually running (check the menu bar)
- Docker might need permission to access your files
- Make sure you have enough free disk space

### Linux Users
- Check that the Docker service is running: `systemctl status docker`
- Make sure your user can run Docker commands (you might need to be in the docker group)
- Check if your firewall is blocking the ports LibreChat needs
