# TriNoVA AI

A powerful AI chat application with dual modes: Agent mode (MCP/Tensora core features) and Webscraper mode (dedicated web scraping agent).

## Features

- **Agent Mode**: Full MCP framework integration with Tensora AI core features
- **Webscraper Mode**: Dedicated deep research agent for web scraping and analysis
- Real-time chat interface
- Conversation history management
- Multiple AI provider support (Gemini, Groq, OpenAI, Claude)

## Project Structure

```
├── server/              # Backend (Python/Flask)
│   ├── proxy.py        # Main Flask server
│   ├── webscraper/     # Webscraper agent
│   └── ...
├── src/                # Frontend (React/Vite)
│   ├── App.jsx
│   ├── components/
│   └── ...
└── ...
```

## Deployment

### Backend (Render)

1. **Create a new Web Service on Render**
   - Connect your GitHub repository
   - Select "Python" as the environment
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `cd server && python proxy.py`

2. **Set Environment Variables in Render Dashboard:**
   ```
   PORT=4000
   FLASK_ENV=production
   ALLOWED_ORIGINS=https://your-vercel-app.vercel.app
   GEMINI_API_KEY=your_key
   NEBIUS_API_KEY=your_key
   SGAI_API_KEY=your_key
   ```

3. **Deploy**
   - Render will automatically deploy on push to main branch

### Frontend (Vercel)

1. **Install Vercel CLI** (if not already installed):
   ```bash
   npm i -g vercel
   ```

2. **Deploy to Vercel:**
   ```bash
   vercel
   ```

3. **Set Environment Variables in Vercel Dashboard:**
   ```
   VITE_API_BASE_URL=https://your-render-backend.onrender.com
   ```

4. **Alternative: Connect via GitHub**
   - Go to Vercel dashboard
   - Import your GitHub repository
   - Set environment variables
   - Deploy

## Local Development

### Backend
```bash
cd server
python proxy.py
```

### Frontend
```bash
npm install
npm run dev
```

## Environment Variables

See `.env.example` for required environment variables.

## License

MIT
