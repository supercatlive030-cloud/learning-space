# The Cats Arcade with AI Chat

A web arcade with games and a real AI assistant powered by a secure backend proxy.

## Features

- 🎮 15 playable games
- 🤖 Real AI chat assistant (powered by OpenAI, Hugging Face, or fallback)
- 🔒 Secure API key management (keys hidden in server environment)
- 🎨 Dark/Light theme with customizable colors
- 💾 Local storage for user data
- 📱 Responsive mobile design

## Setup Instructions

### 1. Install Dependencies

```bash
npm install
```

This installs:
- `express` - Web server
- `cors` - Cross-origin requests
- `dotenv` - Environment variable management
- `axios` - HTTP client
- `compression` - Response compression
- `helmet` - Security headers

### 2. Configure AI API (Optional)

To enable real AI responses, add an API key to `.env`:

#### Option A: OpenAI (Recommended)
1. Sign up at https://platform.openai.com
2. Get your API key from https://platform.openai.com/api-keys
3. In `.env`, set: `AI_API_KEY=sk-...`

#### Option B: Hugging Face (Free)
1. Sign up at https://huggingface.co
2. Get your API token from https://huggingface.co/settings/tokens
3. In `.env`, set: `AI_API_KEY=hf_...`

#### Option C: Use Fallback
Leave `AI_API_KEY` empty in `.env` to use local fallback responses (no API key needed).

### 3. Start the Server

```bash
npm start
```

The server will run on `http://localhost:3000`

### 4. Access the Application

Open your browser and go to:
```
http://localhost:3000
```

**Login credentials:**
- Password: `012312`

## API Endpoints

### POST `/api/chat`

Send a message to the AI assistant.

**Request:**
```json
{
  "message": "What games do you have?"
}
```

**Response:**
```json
{
  "response": "We have 15 awesome games!",
  "source": "ai"
}
```

### GET `/api/health`

Check server status.

**Response:**
```json
{
  "status": "ok",
  "timestamp": "2024-01-01T12:00:00.000Z"
}
```

## Security Features

✅ API keys stored on server only (never sent to frontend)
✅ Request validation and sanitization
✅ XSS protection with text sanitization
✅ Helmet security headers
✅ CORS configuration
✅ Input size limits
✅ Error handling without exposing sensitive data

## File Structure

```
├── index.html              # Main UI
├── server.js               # Express backend
├── package.json            # Dependencies
├── .env                    # Environment variables (git-ignored)
├── .gitignore              # Git ignore rules
├── js/
│   ├── app-refactored.js   # Frontend logic
│   └── games.json          # Game list
├── css/
│   └── styles.css          # Styles
└── games/                  # Game directories
    ├── 2048/
    ├── pacman/
    ├── ... (13 more games)
```

## Troubleshooting

### "AI_API_KEY not configured" message
This is normal! The server is using fallback responses. To enable real AI:
1. Add an API key to `.env`
2. Restart the server

### Chat not working
1. Check browser console (F12) for errors
2. Verify server is running: `http://localhost:3000/api/health`
3. Check server terminal for error messages

### Port already in use
Change the port in `.env`:
```
PORT=3001
```

## Console Validation

The app logs startup info including AI configuration status. No errors should appear in the browser console during normal operation.

```javascript
// Server logs on startup:
🐱 Cats Arcade server running on http://localhost:3000
AI Chat API: POST http://localhost:3000/api/chat
// (If API key is configured, real AI is enabled)
// (If not, fallback responses are used)
```

## Development

### Enable debug logging
```bash
NODE_ENV=development npm start
```

### Test the API
```bash
curl -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello!"}'
```

## License

MIT

## Support

For issues or questions, use the "Support" section in the app!
