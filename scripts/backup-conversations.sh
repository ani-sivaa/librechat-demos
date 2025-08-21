#!/bin/bash

echo "LibreChat Conversation Backup"
echo "============================="

BACKUP_DIR="backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "Backing up conversations..."
docker exec chat-mongodb mongodump --db LibreChat --out /tmp/backup
docker cp chat-mongodb:/tmp/backup "$BACKUP_DIR/mongodb"

echo "Backing up configurations..."
cp demo1-multi-model-comparison/librechat.yaml "$BACKUP_DIR/demo1-config.yaml"
cp demo2-preset-workspace/librechat.yaml "$BACKUP_DIR/demo2-config.yaml"
cp demo2-preset-workspace/presets/preset-templates.json "$BACKUP_DIR/presets.json"

echo "Creating archive..."
tar -czf "$BACKUP_DIR.tar.gz" "$BACKUP_DIR"
rm -rf "$BACKUP_DIR"

echo "✅ Backup created: $BACKUP_DIR.tar.gz"
