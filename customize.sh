#!/usr/bin/env bash
# Run in Cubic's chroot after copying proxy-os-neon.svg to /usr/share/backgrounds.
set -Eeuo pipefail

export DEBIAN_FRONTEND=noninteractive

[[ -f /usr/share/backgrounds/proxy-os-neon.svg ]] || {
  echo 'Copy proxy-os-neon.svg into /usr/share/backgrounds before running this script.' >&2
  exit 1
}

dpkg --add-architecture i386
apt-get update
apt-get install -y --no-install-recommends \
  flatpak gnome-software gnome-software-plugin-flatpak dconf-cli pciutils \
  mesa-vulkan-drivers mesa-vulkan-drivers:i386 vulkan-tools \
  steam-devices gamemode mangohud linux-firmware

# Keep Ubuntu's package identity, repositories, and update path intact.
# Change only the visible name in the release display fields.
os_release_file=/etc/os-release
if [[ -L /etc/os-release && -f /usr/lib/os-release ]]; then
  os_release_file=/usr/lib/os-release
fi
sed -i \
  's/^NAME=.*/NAME="Proxy OS"/; s/^PRETTY_NAME=.*/PRETTY_NAME="Proxy OS 26.04 LTS"/' \
  "$os_release_file"

install -d -m 0755 /etc/dconf/db/local.d
if [[ ! -f /etc/dconf/profile/user ]]; then
  install -d -m 0755 /etc/dconf/profile
  cat > /etc/dconf/profile/user <<'EOF'
user-db:user
system-db:local
EOF
fi
cat > /etc/dconf/db/local.d/00-proxy-os <<'EOF'
[org/gnome/desktop/background]
picture-uri='file:///usr/share/backgrounds/proxy-os-neon.svg'
picture-uri-dark='file:///usr/share/backgrounds/proxy-os-neon.svg'
EOF
dconf update

# Web shortcuts and official Resolve download page; no third-party application
# binaries are bundled in the ISO.
install -d -m 0755 /usr/share/applications
cat > /usr/share/applications/chatgpt.desktop <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=ChatGPT
Comment=Open ChatGPT
Exec=xdg-open https://chatgpt.com/
Terminal=false
Icon=web-browser
Categories=Network;WebBrowser;
EOF
cat > /usr/share/applications/claude.desktop <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Claude
Comment=Open Claude
Exec=xdg-open https://claude.ai/
Terminal=false
Icon=web-browser
Categories=Network;WebBrowser;
EOF
cat > /usr/share/applications/davinci-resolve.desktop <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=DaVinci Resolve for Linux
Comment=Open the official DaVinci Resolve download page
Exec=xdg-open https://www.blackmagicdesign.com/products/davinciresolve
Terminal=false
Icon=applications-multimedia
Categories=AudioVideo;Video;
EOF

# Add the app catalog only. Flatpak apps install per user after first boot via
# install.sh, avoiding incomplete app installations during ISO construction.
flatpak remote-add --system --if-not-exists flathub \
  https://dl.flathub.org/repo/flathub.flatpakrepo

apt-get clean
rm -rf /var/lib/apt/lists/*
echo 'Proxy OS base customization finished. Install apps after first login with install.sh.'

# Additional purpose-specific applications installed into the customized image.
flatpak install --system --noninteractive flathub org.prismlauncher.PrismLauncher org.blender.Blender org.gimp.GIMP

# Ten additional purpose-specific applications
flatpak install --system --noninteractive flathub org.godotengine.Godot org.blender.Blender com.vscodium.codium org.gnome.Boxes org.gnome.Logs org.gnome.Calculator org.gnome.baobab com.github.tchx84.Flatseal org.gnome.TextEditor org.gnome.Calendar
