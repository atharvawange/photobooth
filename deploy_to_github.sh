#!/bin/bash

# This script helps deploy your Flask Photobooth application to GitHub

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install git first."
    exit 1
fi

# Initialize git repository if not already done
if [ ! -d ".git" ]; then
    git init
    echo "Git repository initialized."
else
    echo "Git repository already exists."
fi

# Create necessary directories if they don't exist
mkdir -p static/uploads
mkdir -p static/qr_codes

# Create .gitkeep files to track empty directories
touch static/uploads/.gitkeep
touch static/qr_codes/.gitkeep

# Add all files to git
git add .

# Initial commit
git commit -m "Initial commit of Flask Photobooth application"

# Ask for GitHub repository URL
echo "Enter your GitHub repository URL (e.g., https://github.com/yourusername/photobooth-app.git):"
read github_url

# Add the remote repository
git remote add origin $github_url

# Push to GitHub
echo "Pushing to GitHub..."
git push -u origin master || git push -u origin main

echo "Deployment to GitHub completed!"
echo "Your application is now available on GitHub."
echo ""
echo "Next steps for deploying to a hosting platform:"
echo "1. For Heroku: Run 'heroku create' and 'git push heroku main'"
echo "2. For AWS, Google Cloud, or DigitalOcean: Follow their specific deployment instructions"
echo ""
echo "Don't forget to set up your environment variables in your hosting platform:"
echo "- DATABASE_URL"
echo "- SESSION_SECRET"