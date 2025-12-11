#!/bin/bash

# TriNoVA AI - Deployment Script
# This script initializes git and pushes to GitHub

echo "🚀 TriNoVA AI - Deployment Setup"
echo "=================================="

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install git first."
    exit 1
fi

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
    echo "📦 Initializing git repository..."
    git init
    echo "✅ Git repository initialized"
else
    echo "✅ Git repository already initialized"
fi

# Add remote if not exists
if ! git remote | grep -q "origin"; then
    echo "🔗 Adding remote repository..."
    git remote add origin https://github.com/lakshmanmandapati/TriNoVA-AI.git
    echo "✅ Remote added"
else
    echo "✅ Remote already exists"
    # Update remote URL in case it changed
    git remote set-url origin https://github.com/lakshmanmandapati/TriNoVA-AI.git
fi

# Add all files
echo "📝 Staging files..."
git add .

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo "⚠️  No changes to commit"
else
    echo "💾 Committing changes..."
    git commit -m "Initial commit: TriNoVA AI - Agent and Webscraper modes"
    echo "✅ Changes committed"
fi

# Set main branch
echo "🌿 Setting main branch..."
git branch -M main

# Push to GitHub
echo "⬆️  Pushing to GitHub..."
echo ""
echo "⚠️  Note: You may need to authenticate with GitHub"
echo "   If prompted, use a Personal Access Token instead of password"
echo ""
read -p "Press Enter to continue with push..."

git push -u origin main

echo ""
echo "✅ Deployment setup complete!"
echo ""
echo "Next steps:"
echo "1. Deploy backend to Render (see DEPLOYMENT.md)"
echo "2. Deploy frontend to Vercel (see DEPLOYMENT.md)"
echo "3. Set environment variables in both platforms"
echo "4. Update ALLOWED_ORIGINS in Render with your Vercel URL"

