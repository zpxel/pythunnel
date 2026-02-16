#!/data/data/com.termux/files/usr/bin/bash

clear
echo "========================================"
echo "  ZPXEL - Termux Dependency Installer"
echo "  Buy me a coffee ☕ 0945-156-2126"
echo "========================================"
echo

# Update system
echo "[+] Updating system..."
pkg update -y && pkg upgrade -y

# Required packages list
PACKAGES=(
  python
  tmux
  curl
  wget
  termux-api
)

# Function to check & install packages
install_if_missing() {
  PKG=$1
  if command -v $PKG >/dev/null 2>&1; then
      echo "[✓] $PKG already installed"
  else
      echo "[+] Installing $PKG ..."
      pkg install -y $PKG
  fi
}

# Install required packages
echo
echo "[+] Checking dependencies..."
for p in "${PACKAGES[@]}"; do
  install_if_missing $p
done

# Check cloudflared
echo
echo "[+] Checking cloudflared..."
if command -v cloudflared >/dev/null 2>&1; then
    echo "[✓] cloudflared already installed"
else
    echo "[+] Installing cloudflared..."
    wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm -O cloudflared
    chmod +x cloudflared
    mv cloudflared $PREFIX/bin/
fi

# Test everything
echo
echo "[+] Testing installation..."

python3 --version || echo "[!] Python problem"
tmux -V || echo "[!] tmux problem"
cloudflared --version || echo "[!] cloudflared problem"

echo
echo "========================================"
echo "   INSTALLATION COMPLETE"
echo "========================================"
echo
echo "You can now run your script safely."
echo "if you want to open your localhost."
echo "type python pylocal_enc.py"
echo "for the cloudflared"
echo "type pycloud_enc.py"
