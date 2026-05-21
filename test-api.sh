#!/bin/bash

# Test script for Cats Arcade API
# Usage: bash test-api.sh

echo "🐱 Testing Cats Arcade API..."
echo ""

# Check if server is running
echo "📡 Checking server health..."
HEALTH=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/api/health)

if [ "$HEALTH" = "200" ]; then
    echo "✅ Server is running on port 3000"
else
    echo "❌ Server is not responding (expected 200, got $HEALTH)"
    echo "   Run: npm start"
    exit 1
fi

echo ""
echo "💬 Testing chat API..."

# Send a test message
RESPONSE=$(curl -s -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello, what games do you have?"}')

echo "Response:"
echo "$RESPONSE" | grep -o '"response":"[^"]*"' || echo "No response received"

echo ""
echo "✅ API tests complete!"
echo ""
echo "🎮 Access the app at: http://localhost:3000"
