#!/bin/bash

# Easy run script for Recommendation System

echo "=========================================="
echo "🛒 E-commerce Recommendation System"
echo "=========================================="
echo ""

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Install requirements
echo "📥 Installing dependencies..."
pip install -r requirements.txt --quiet

echo ""
echo "=========================================="
echo "✅ Setup complete!"
echo "=========================================="
echo ""
echo "Choose an option:"
echo ""
echo "1) 🌐 Run Streamlit Web App (Recommended)"
echo "2) 🚀 Run FastAPI Backend"
echo "3) 📊 Generate Data (if not done)"
echo "4) 🧪 Train Models (if not done)"
echo ""

read -p "Enter choice (1-4): " choice

case $choice in
    1)
        echo ""
        echo "🌐 Starting Streamlit Web App..."
        echo "📱 Open browser at: http://localhost:8501"
        echo ""
        streamlit run streamlit_app.py
        ;;
    2)
        echo ""
        echo "🚀 Starting FastAPI Backend..."
        echo "📖 API Docs at: http://localhost:8000/docs"
        echo ""
        cd api && python app.py
        ;;
    3)
        echo ""
        echo "📊 Generating dataset..."
        cd data && python generate_data.py
        ;;
    4)
        echo ""
        echo "🧪 Training models..."
        cd src && python model_1_collaborative_filtering.py
        ;;
    *)
        echo "Invalid choice!"
        ;;
esac
