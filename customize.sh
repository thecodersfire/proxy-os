#!/usr/bin/env bash
# Run inside Cubic's chroot terminal while building the ISO.
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
dpkg --add-architecture i386
apt-get update
apt-get install -y --no-install-recommends \
  flatpak gnome-software gnome-software-plugin-flatpak dconf-cli \
  mesa-vulkan-drivers mesa-vulkan-drivers:i386 vulkan-tools \
  linux-firmware

# Keep Ubuntu's compatibility identity for package management, but show the
# user's distro name in system information. Update the target of Ubuntu's
# /etc/os-release symlink when present.
os_release_file=/etc/os-release
if [[ -L /etc/os-release && -f /usr/lib/os-release ]]; then
  os_release_file=/usr/lib/os-release
fi
sed -i 's/^NAME=.*/NAME="Proxy OS"/; s/^PRETTY_NAME=.*/PRETTY_NAME="Proxy OS 26.04 LTS"/' "$os_release_file"

if [[ ! -f /usr/share/backgrounds/proxy-os-neon.svg ]]; then
  echo "Copy proxy-os-neon.svg to /usr/share/backgrounds/ in Cubic before running this script." >&2
  exit 1
fi
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

# Make the Flatpak catalog available in the installed system and live session.
flatpak remote-add --system --if-not-exists flathub \
  https://flathub.org/repo/flathub.flatpakrepo

# Preload the gaming launchers into the image. They appear in the app menu and
# can be updated through GNOME Software after installation.
flatpak install --system --noninteractive flathub \
  com.valvesoftware.Steam \
  com.heroicgameslauncher.hgl \
  net.lutris.Lutris \
  com.usebottles.bottles \
  org.mozilla.firefox \
  com.opera.opera-gx

apt-get clean
rm -rf /var/lib/apt/lists/*
