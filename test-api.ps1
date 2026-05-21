# Test script for Cats Arcade API (Windows PowerShell)
# Usage: powershell -ExecutionPolicy Bypass -File test-api.ps1

Write-Host "`n🐱 Testing Cats Arcade API...`n" -ForegroundColor Cyan

# Check if server is running
Write-Host "📡 Checking server health..." -ForegroundColor Yellow

try {
    $response = Invoke-WebRequest -Uri "http://localhost:3000/api/health" -Method Get -ErrorAction Stop
    
    if ($response.StatusCode -eq 200) {
        Write-Host "✅ Server is running on port 3000" -ForegroundColor Green
    }
} catch {
    Write-Host "❌ Server is not responding" -ForegroundColor Red
    Write-Host "   Run: npm start" -ForegroundColor Yellow
    exit 1
}

Write-Host "`n💬 Testing chat API...`n" -ForegroundColor Yellow

# Send a test message
$body = @{
    message = "Hello, what games do you have?"
} | ConvertTo-Json

try {
    $response = Invoke-WebRequest -Uri "http://localhost:3000/api/chat" `
        -Method Post `
        -Headers @{"Content-Type" = "application/json"} `
        -Body $body `
        -ErrorAction Stop
    
    $data = $response.Content | ConvertFrom-Json
    
    Write-Host "Response:" -ForegroundColor Green
    Write-Host $data.response -ForegroundColor White
    Write-Host "Source: $($data.source)" -ForegroundColor Gray
} catch {
    Write-Host "❌ API error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host "`n✅ API tests complete!" -ForegroundColor Green
Write-Host "`n🎮 Access the app at: http://localhost:3000`n" -ForegroundColor Cyan
