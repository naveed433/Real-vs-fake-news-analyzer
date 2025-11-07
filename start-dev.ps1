Write-Host "🚀 Starting Real vs Fake News Application..." -ForegroundColor Green

# Stop any existing node processes
Write-Host "Stopping any existing Node.js processes..." -ForegroundColor Yellow
Get-Process node -ErrorAction SilentlyContinue | Stop-Process -Force

# Start backend
Write-Host "`n📦 Starting backend server..." -ForegroundColor Cyan
$backendJob = Start-Job -ScriptBlock {
    Set-Location "E:\Real vs fake news FYP\deploy_backend"
    npm run dev
}

# Wait for backend to be ready
Start-Sleep -Seconds 3

# Start frontend
Write-Host "`n🌐 Starting frontend development server..." -ForegroundColor Cyan
Set-Location "E:\Real vs fake news FYP"
npm run dev

# Cleanup on exit
Register-EngineEvent PowerShell.Exiting -Action {
    Write-Host "`n🛑 Cleaning up..." -ForegroundColor Yellow
    Get-Process node -ErrorAction SilentlyContinue | Stop-Process -Force
    Remove-Job * -Force
}