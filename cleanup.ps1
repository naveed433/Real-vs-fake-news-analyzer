# Project Cleanup Script
# This script removes unnecessary files while preserving essential ones

$filesToRemove = @(
    # Root directory
    "assemble_deploy.ps1",
    "START_BACKEND.bat",
    "hostinger_deploy.zip",
    
    # Backend directory duplicates
    "backend/start-server.bat",
    "backend/start-simple.ps1",
    "backend/server.js",  # Using src/index.js instead
    "backend/QUICK_FIX.md",
    "backend/START.md",
    "backend/test_supabase_query.js",
    "backend/.env.production",  # Using .env for all environments
    
    # Duplicate documentation
    "backend/SETUP.md",
    "backend/README-backend.md",
    
    # Old build artifacts
    "backend/build",
    "backend/database.sqlite"  # Using Supabase instead
)

$dirsToRemove = @(
    "deploy_bundle",  # Using hostinger_deploy instead
    ".qodo"  # IDE-specific directory
)

Write-Host "`n=== Cleaning up project files ===" -ForegroundColor Cyan

# Remove unnecessary files
foreach ($file in $filesToRemove) {
    $path = Join-Path (Get-Location) $file
    if (Test-Path $path) {
        Write-Host "Removing file: $file" -ForegroundColor Yellow
        Remove-Item $path -Force
    }
}

# Remove unnecessary directories
foreach ($dir in $dirsToRemove) {
    $path = Join-Path (Get-Location) $dir
    if (Test-Path $path) {
        Write-Host "Removing directory: $dir" -ForegroundColor Yellow
        Remove-Item $path -Recurse -Force
    }
}

# Consolidate documentation
$readmeContent = @"
# Real vs Fake News Analyzer

## Project Structure
- \`/src\` - Frontend React application
- \`/backend\` - Node.js backend server
- \`/hostinger_deploy\` - Production deployment bundle

## Development
1. Start Backend:
   \`\`\`bash
   cd backend
   npm install
   npm run dev
   \`\`\`

2. Start Frontend:
   \`\`\`bash
   npm install
   npm run dev
   \`\`\`

## Deployment
1. Build frontend:
   \`\`\`bash
   npm run build
   \`\`\`

2. Copy files to hosting:
   - Upload \`build/*\` to \`public_html/\`
   - Upload \`backend/\` to server
   - Configure environment variables
   - Start backend with PM2

## Environment Setup
1. Frontend (.env):
   \`\`\`
   VITE_API_URL=https://your-api-domain.com
   \`\`\`

2. Backend (.env):
   \`\`\`
   PORT=4001
   JWT_SECRET=your_secure_secret
   CORS_ORIGIN=https://your-frontend-domain.com
   SUPABASE_URL=your_supabase_url
   SUPABASE_KEY=your_supabase_key
   \`\`\`

## API Endpoints
- \`/health\` - Server health check
- \`/api/analyze\` - Analyze article text
- \`/api/analyze-image\` - Analyze article image
- \`/auth/guest\` - Guest login
"@

Write-Host "`nUpdating README.md..." -ForegroundColor Cyan
$readmeContent | Out-File -FilePath "README.md" -Encoding utf8

Write-Host "`nCleanup complete!" -ForegroundColor Green
Write-Host "Removed unnecessary files and consolidated documentation." -ForegroundColor Green