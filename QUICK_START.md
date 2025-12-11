# Quick Start - Push to GitHub

## Option 1: Use the Deployment Script (Recommended)

```bash
./deploy.sh
```

This script will:
- Initialize git repository
- Add remote origin
- Stage all files
- Commit changes
- Push to GitHub

## Option 2: Manual Git Commands

```bash
# Initialize git (if not already done)
git init

# Add remote repository
git remote add origin https://github.com/lakshmanmandapati/TriNoVA-AI.git

# Stage all files
git add .

# Commit changes
git commit -m "Initial commit: TriNoVA AI - Agent and Webscraper modes"

# Set main branch
git branch -M main

# Push to GitHub
git push -u origin main
```

## After Pushing to GitHub

1. **Deploy Backend to Render:**
   - Go to https://render.com
   - Create new Web Service
   - Connect GitHub repo
   - Set environment variables (see DEPLOYMENT.md)
   - Deploy

2. **Deploy Frontend to Vercel:**
   - Go to https://vercel.com
   - Import GitHub repo
   - Set `VITE_API_BASE_URL` environment variable
   - Deploy

3. **Update CORS:**
   - After getting Vercel URL, update `ALLOWED_ORIGINS` in Render dashboard

## Important Files Created

- `.gitignore` - Excludes sensitive files and build artifacts
- `Dockerfile.backend` - For Render deployment
- `Dockerfile.frontend` - For Vercel deployment (if needed)
- `vercel.json` - Vercel configuration
- `render.yaml` - Render configuration
- `DEPLOYMENT.md` - Detailed deployment guide

