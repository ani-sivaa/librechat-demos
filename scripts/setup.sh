#!/bin/bash

echo "LibreChat Demo Setup"
echo "===================="

if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "Error: Docker Compose is not installed"
    exit 1
fi

echo "Which demo do you want to setup?"
echo "1) Multi-Model Comparison"
echo "2) Preset Workspace"
read -p "Enter choice (1 or 2): " choice

case $choice in
    1)
        cd demo1-multi-model-comparison
        ;;
    2)
        cd demo2-preset-workspace
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

if [ ! -f .env ]; then
    cp .env.example .env
    echo "Created .env file"
    echo "Please edit .env and add your API keys"
    read -p "Press enter when ready..."
fi

echo "Starting LibreChat..."
docker-compose up -d

echo "Waiting for services to start..."
sleep 10

if curl -s http://localhost:3080 > /dev/null; then
    echo "✅ LibreChat is running at http://localhost:3080"
else
    echo "❌ LibreChat failed to start. Check logs with: docker-compose logs"
fi
