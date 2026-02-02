@echo off
REM Easy run script for Windows

echo ==========================================
echo E-commerce Recommendation System
echo ==========================================
echo.

REM Check if virtual environment exists
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Install requirements
echo Installing dependencies...
pip install -r requirements.txt --quiet

echo.
echo ==========================================
echo Setup complete!
echo ==========================================
echo.
echo Choose an option:
echo.
echo 1) Run Streamlit Web App (Recommended)
echo 2) Run FastAPI Backend
echo 3) Generate Data (if not done)
echo 4) Train Models (if not done)
echo.

set /p choice="Enter choice (1-4): "

if "%choice%"=="1" (
    echo.
    echo Starting Streamlit Web App...
    echo Open browser at: http://localhost:8501
    echo.
    streamlit run streamlit_app.py
) else if "%choice%"=="2" (
    echo.
    echo Starting FastAPI Backend...
    echo API Docs at: http://localhost:8000/docs
    echo.
    cd api
    python app.py
) else if "%choice%"=="3" (
    echo.
    echo Generating dataset...
    cd data
    python generate_data.py
) else if "%choice%"=="4" (
    echo.
    echo Training models...
    cd src
    python model_1_collaborative_filtering.py
) else (
    echo Invalid choice!
)

pause
