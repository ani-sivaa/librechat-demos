#!/bin/bash

echo "Checking LibreChat Health..."

if curl -s http://localhost:3080/health > /dev/null; then
    echo "✅ API is healthy"
else
    echo "❌ API is not responding"
fi

if docker exec chat-mongodb mongosh --eval "db.adminCommand('ping')" > /dev/null 2>&1; then
    echo "✅ MongoDB is healthy"
else
    echo "❌ MongoDB is not responding"
fi

if curl -s http://localhost:7700/health > /dev/null; then
    echo "✅ MeiliSearch is healthy"
else
    echo "❌ MeiliSearch is not responding"
fi

USAGE=$(df -h . | awk 'NR==2 {print $5}' | sed 's/%//')
if [ $USAGE -lt 80 ]; then
    echo "✅ Disk usage is OK ($USAGE%)"
else
    echo "⚠️ Disk usage is high ($USAGE%)"
fi
