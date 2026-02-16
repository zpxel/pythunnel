#!/data/data/com.termux/files/usr/bin/bash

clear
echo "======================================"
echo "   ZPXEL | UNIVERSAL DEPENDENCY INSTALLER"
echo "======================================"
echo ""

sleep 1

echo "[+] Updating Termux packages..."
pkg update -y && pkg upgrade -y

echo ""
echo "[+] Installing core packages..."
pkg install python git wget curl openssl tar unzip termux-api -y

echo ""
echo "[+] Upgrading pip..."
pip install --upgrade pip

echo ""
echo "[+] Installing python modules..."
pip install --upgrade requests

echo ""
echo "[+] Installing Cloudflared..."

ARCH=$(uname -m)
CLOUDFLARED_URL=""

if [[ "$ARCH" == "aarch64" ]]; then
    CLOUDFLARED_URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64"
elif [[ "$ARCH" == "armv7l" ]]; then
    CLOUDFLARED_URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm"
elif [[ "$ARCH" == "x86_64" ]]; then
    CLOUDFLARED_URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64"
else
    echo "[!] Unsupported architecture: $ARCH"
    exit 1
fi

wget -q $CLOUDFLARED_URL -O cloudflared
chmod +x cloudflared
mv cloudflared $PREFIX/bin/

echo ""
echo "[✓] All dependencies installed successfully!"
echo "[✓] Cloudflared installed!"
echo ""
echo "Run your script now with:"
echo "python local_enc.py"
echo " and "
echo "cftunnel_enc.py"
echo ""
