#!/bin/bash
# WiFi Voucher Bot — Auto Install Script
# Ubuntu/Debian VPS အတွက်
# Run: bash install.sh

set -e
echo "================================================"
echo "  WiFi Voucher Bot — Installing..."
echo "================================================"

# System packages
echo "[1/4] System packages installing..."
sudo apt-get update -qq
sudo apt-get install -y python3 python3-pip tor libgl1-mesa-glx libglib2.0-0 2>/dev/null

# Python packages
echo "[2/4] Python packages installing..."
pip3 install --quiet pyTelegramBotAPI aiohttp aiohttp-socks ddddocr opencv-python numpy

# Start Tor service
echo "[3/4] Starting Tor..."
sudo systemctl enable tor 2>/dev/null || true
sudo systemctl start tor 2>/dev/null || true

# Run bot
echo "[4/4] Starting Bot..."
echo ""
echo "================================================"
echo "  Bot starting! Press Ctrl+C to stop."
echo "  Background run: nohup python3 bot.py &"
echo "================================================"
python3 bot.py
