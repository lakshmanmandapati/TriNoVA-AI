# Deployment Guide

## Backend Deployment (Render)

### Step 1: Create Render Account
1. Go to https://render.com
2. Sign up/login with GitHub

### Step 2: Create New Web Service
1. Click "New +" → "Web Service"
2. Connect your GitHub repository: `lakshmanmandapati/TriNoVA-AI`
3. Configure:
   - **Name**: `trinova-backend`
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `cd server && python proxy.py`
   - **Root Directory**: Leave empty (root)

### Step 3: Set Environment Variables
In Render dashboard, go to "Environment" tab and add:

```
PORT=4000
FLASK_ENV=production
ALLOWED_ORIGINS=https://your-vercel-app.vercel.app
GEMINI_API_KEY=your_gemini_api_key
NEBIUS_API_KEY=your_nebius_api_key
SGAI_API_KEY=your_scrapegraph_api_key
```

**Important**: Replace `https://your-vercel-app.vercel.app` with your actual Vercel frontend URL after deploying.

### Step 4: Deploy
- Render will auto-deploy on push to main branch
- Note your backend URL (e.g., `https://trinova-backend.onrender.com`)

---

## Frontend Deployment (Vercel)

### Step 1: Install Vercel CLI
```bash
npm i -g vercel
```

### Step 2: Deploy
```bash
vercel
```

Follow the prompts:
- Set up and deploy? **Yes**
- Which scope? (select your account)
- Link to existing project? **No**
- Project name? `trinova-frontend` (or your choice)
- Directory? `./`
- Override settings? **No**

### Step 3: Set Environment Variables
In Vercel dashboard:
1. Go to your project → Settings → Environment Variables
2. Add:
   ```
   VITE_API_BASE_URL=https://your-render-backend.onrender.com
   ```
   Replace with your actual Render backend URL

### Step 4: Redeploy
After setting environment variables, trigger a new deployment:
```bash
vercel --prod
```

Or redeploy from Vercel dashboard.

---

## Alternative: Deploy via GitHub Integration

### Render (Backend)
1. Connect GitHub repo in Render
2. Render will auto-detect Python
3. Set environment variables
4. Deploy

### Vercel (Frontend)
1. Go to https://vercel.com
2. Click "Add New Project"
3. Import GitHub repository
4. Configure:
   - Framework Preset: **Vite**
   - Root Directory: `./`
   - Build Command: `npm run build`
   - Output Directory: `dist`
5. Add environment variable: `VITE_API_BASE_URL`
6. Deploy

---

## Post-Deployment Checklist

- [ ] Backend is running on Render
- [ ] Frontend is deployed on Vercel
- [ ] Environment variables are set correctly
- [ ] CORS is configured with frontend URL
- [ ] Test Agent mode
- [ ] Test Webscraper mode
- [ ] Check browser console for any errors

---

## Troubleshooting

### Backend Issues
- Check Render logs for errors
- Verify all environment variables are set
- Ensure PORT is set correctly (Render sets this automatically)

### Frontend Issues
- Check Vercel build logs
- Verify `VITE_API_BASE_URL` is set correctly
- Check browser console for CORS errors
- Update `ALLOWED_ORIGINS` in Render if needed

### CORS Errors
- Add your Vercel URL to `ALLOWED_ORIGINS` in Render
- Format: `https://your-app.vercel.app` (no trailing slash)

