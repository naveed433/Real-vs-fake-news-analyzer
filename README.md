# Real vs Fake News Analyzer

## Project Structure
- \/src\ - Frontend React application
- \/backend\ - Node.js backend server
- \/hostinger_deploy\ - Production deployment bundle

## Development
1. Start Backend:
   \\\ash
   cd backend
   npm install
   npm run dev
   \\\

2. Start Frontend:
   \\\ash
   npm install
   npm run dev
   \\\

## Deployment
1. Build frontend:
   \\\ash
   npm run build
   \\\

2. Copy files to hosting:
   - Upload \uild/*\ to \public_html/\
   - Upload \ackend/\ to server
   - Configure environment variables
   - Start backend with PM2

## Environment Setup
1. Frontend (.env):
   \\\
   VITE_API_URL=https://your-api-domain.com
   \\\

2. Backend (.env):
   \\\
   PORT=4001
   JWT_SECRET=your_secure_secret
   CORS_ORIGIN=https://your-frontend-domain.com
   SUPABASE_URL=your_supabase_url
   SUPABASE_KEY=your_supabase_key
   \\\

## API Endpoints
- \/health\ - Server health check
- \/api/analyze\ - Analyze article text
- \/api/analyze-image\ - Analyze article image
- \/auth/guest\ - Guest login
