@echo off
title ISRAP AIRMAPS Intelligence Studio
echo ============================================================
echo  ISRAP AIRMAPS Intelligence Studio
echo  Anomaly Detection, Data Quality, and Intelligent Imputation
echo ============================================================
echo.

:: Check if streamlit is available
where streamlit >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] streamlit not found. Install with: pip install -r requirements.txt
    pause
    exit /b 1
)

echo Starting Streamlit app on http://localhost:8501
echo Press Ctrl+C to stop.
echo.
streamlit run app.py --server.port 8501
pause
