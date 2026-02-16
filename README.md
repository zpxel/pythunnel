🌀 Pythunnel
Author: ZPXEL
Note: Buy me a coffee ☕ 0945-156-2126
Overview
pythunnel is a Python-based Termux utility for setting up either:
A local HTTP server, or
A Cloudflared tunnel to expose your local server online.

Features
Local HTTP Server (local_enc.py)
Serves files on a specified port.
Automatically enables Termux wakelock to keep the device awake.
Cloudflared Tunnel (cftunnel_enc.py)
Exposes local servers via Cloudflare tunnels.
Automatically detects the public URL and prints it for easy access.

Auto Dependency Installer (auto_install.sh)
Installs all required packages for Termux: Python, Git, curl, wget, requests, termux-api
Installs Cloudflared automatically for the device architecture
One-tap setup

Clone the repository:
Bash
Copy code
git clone https://github.com/zpxel/pythunnel.git
cd pythunnel
Run the dependency installer:
Bash
Copy code
chmod +x auto_install.sh
./auto_install.sh
Usage
Local HTTP server:
Bash
Copy code
python local_enc.py
Cloudflared tunnel:
Bash
Copy code
python cftunnel_enc.py

License
MIT License (or whichever you prefer)

if theres an error check your pid

by simply typing

ps
or
ps aux

if you see running python or python3
kill all python

pkill -f python
pkill -f python3

then run the script again. thank you 👀
