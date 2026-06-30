# ISRAP AIRMAPS Intelligence Studio — PowerShell launch script
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " ISRAP AIRMAPS Intelligence Studio" -ForegroundColor White
Write-Host " Anomaly Detection, Data Quality, and Intelligent Imputation" -ForegroundColor Gray
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# Check streamlit
$streamlitPath = Get-Command streamlit -ErrorAction SilentlyContinue
if (-not $streamlitPath) {
    Write-Host "[ERROR] streamlit not found. Install with:" -ForegroundColor Red
    Write-Host "  pip install -r requirements.txt" -ForegroundColor Yellow
    exit 1
}

Write-Host "Starting Streamlit app on http://localhost:8501" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop." -ForegroundColor Gray
Write-Host ""

Set-Location $PSScriptRoot
streamlit run app.py --server.port 8501
