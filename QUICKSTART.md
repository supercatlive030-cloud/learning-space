# Quick Start Guide

## 🚀 Get Started in 3 Steps

### Step 1: Install Dependencies
Open a terminal in this directory and run:
```bash
npm install
```

### Step 2: Start the Server
```bash
npm start
```

You should see:
```
🐱 Cats Arcade server running on http://localhost:3000
AI Chat API: POST http://localhost:3000/api/chat
```

### Step 3: Open in Browser
Go to: **http://localhost:3000**

Login with password: **012312**

---

## 🤖 Enable Real AI (Optional)

### Get Free API Key (Choose One):

#### Option 1: OpenAI (Fast setup, $5 free trial)
1. Go to https://platform.openai.com/api-keys
2. Sign up / Log in
3. Create a new API key
4. Copy the key (starts with `sk-`)

#### Option 2: Hugging Face (Completely Free)
1. Go to https://huggingface.co/settings/tokens
2. Sign up / Log in  
3. Create a new token
4. Copy the token (starts with `hf_`)

### Add Key to .env

Open the `.env` file in this folder and paste your key:
```
AI_API_KEY=your_key_here
```

Then restart the server:
```
npm start
```

---

## ✅ Verify Everything Works

### Browser Console Check
- Press **F12** to open Developer Tools
- Go to **Console** tab
- You should see: **"🐱 Cats Arcade Refactored - Ready!"**
- No red errors should appear

### Server Check
- Go to http://localhost:3000/api/health
- Should see: `{"status":"ok","timestamp":"..."}`

### Chat Test
1. Click **"AI Chat"** in navigation
2. Type a message
3. You should see a typing indicator
4. Get a response (AI if configured, fallback if not)

---

## 📊 What's Included

✅ Real AI chat (OpenAI / Hugging Face / Fallback)  
✅ Secure backend proxy (API keys hidden)  
✅ 15 playable games  
✅ Theme customization  
✅ Local storage persistence  
✅ No console errors  
✅ Mobile responsive  
✅ Keyboard shortcuts (Escape, Ctrl+P)  

---

## 🆘 Troubleshooting

**"Cannot GET /"** → Server not running. Run `npm start`  
**Chat not working** → Check browser console (F12)  
**Port 3000 in use** → Edit `.env` and change PORT=3001  
**API Key errors** → Verify key format in `.env` (sk- or hf-)  

---

## 📝 Commands

| Command | What it does |
|---------|------------|
| `npm install` | Install dependencies |
| `npm start` | Start the server |
| `npm run dev` | Start in development mode |

---

That's it! Enjoy The Cats Arcade! 🐱🎮
