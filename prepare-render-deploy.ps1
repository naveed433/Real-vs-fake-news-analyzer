$deployDir = "deploy_backend"
$zipFile = "render-deploy.zip"

# Ensure we're in the right directory
Set-Location -Path "E:\Real vs fake news FYP"

# Remove old zip if it exists
if (Test-Path $zipFile) {
    Remove-Item $zipFile -Force
}

# Create new zip file
Compress-Archive -Path "$deployDir\*" -DestinationPath $zipFile

Write-Host "Created deployment bundle at $zipFile"

# Supabase and API keys
$env:SUPABASE_URL="https://ikmjaidozrxkawzhxylm.supabase.co"
$env:SUPABASE_ANON_KEY="your-supabase-anon-key"
$env:SUPABASE_SERVICE_ROLE_KEY="your-supabase-service-key"
$env:GEMINI_API_KEY="AIzaSyAE2lsP5vrBt3pldJTLM52BZbR0bkR5UoA"
$env:DEEPSEEK_API_KEY="your-deepseek-key"
$env:GOOGLE_API_KEY="AIzaSyAE2lsP5vrBt3pldJTLM52BZbR0bkR5UoA"
$env:NEWSAPI_KEY="5ce4463b75bb4ba795fc037bf110e4a2"