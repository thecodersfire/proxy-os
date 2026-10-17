#!/usr/bin/env bash
set -euo pipefail

if [[ "${EUID}" -eq 0 ]]; then
  echo "Run this as your normal user; it will ask for sudo when needed." >&2
  exit 1
fi

if ! command -v apt-get >/dev/null || ! grep -qi ubuntu /etc/os-release; then
  echo "Ubuntu is required for this setup script." >&2
  exit 1
fi

echo "Proxy OS setup: graphical app store, browsers, Steam, and gaming support."
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y flatpak gnome-software gnome-software-plugin-flatpak \
  mesa-vulkan-drivers mesa-vulkan-drivers:i386 vulkan-tools

if [[ -f "$(dirname "$0")/proxy-os-neon.svg" ]]; then
  sudo install -m 0644 "$(dirname "$0")/proxy-os-neon.svg" \
    /usr/share/backgrounds/proxy-os-neon.svg
  gsettings set org.gnome.desktop.background picture-uri \
    "file:///usr/share/backgrounds/proxy-os-neon.svg" || true
  gsettings set org.gnome.desktop.background picture-uri-dark \
    "file:///usr/share/backgrounds/proxy-os-neon.svg" || true
fi

# Make the Flathub catalog available to GNOME Software and Flatpak.
if ! flatpak remote-list --system | awk '{print $1}' | grep -qx flathub; then
  sudo flatpak remote-add --system --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo
fi

flatpak install --system --noninteractive flathub com.valvesoftware.Steam

read -r -p "Install Heroic, Lutris, and Bottles now? [y/N] " answer
if [[ "${answer}" =~ ^[Yy]([Ee][Ss])?$ ]]; then
  flatpak install --system --noninteractive flathub \
    com.heroicgameslauncher.hgl net.lutris.Lutris com.usebottles.bottles
fi

flatpak install --system --noninteractive flathub org.mozilla.firefox com.opera.opera-gx

echo
echo "Setup complete. Open Software to browse apps."
echo "For NVIDIA or other proprietary drivers, open Software & Updates → Additional Drivers."
echo "Restart after changing drivers."
