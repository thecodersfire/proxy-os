#!/usr/bin/env bash
set -Eeuo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

fail() {
  printf 'Setup stopped: %s\n' "$*" >&2
  exit 1
}

if [[ "${EUID}" -eq 0 ]]; then
  fail 'run this as your normal user; sudo will request administrator access when needed.'
fi
command -v apt-get >/dev/null || fail 'apt-get was not found.'
[[ -r /etc/os-release ]] || fail 'cannot identify the operating system.'
# shellcheck disable=SC1091
source /etc/os-release
[[ "${ID:-}" == ubuntu ]] || fail 'this installer supports Ubuntu only.'
[[ "$(dpkg --print-architecture)" == amd64 ]] || fail 'the gaming package set currently targets 64-bit Intel/AMD PCs.'

echo 'Proxy OS setup: app store, Steam, browser, Vulkan, and optional gaming tools.'
echo 'No GPU driver, overclock, kernel, firewall, or partition setting will be changed.'

sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
  flatpak gnome-software gnome-software-plugin-flatpak \
  mesa-vulkan-drivers mesa-vulkan-drivers:i386 vulkan-tools \
  steam-devices gamemode mangohud

# Flathub is added for this user, so Flatpak apps do not require system-wide installs.
flatpak remote-add --user --if-not-exists flathub \
  https://dl.flathub.org/repo/flathub.flatpakrepo

install_flatpaks() {
  local -a ids=("$@")
  ((${#ids[@]})) || return 0
  flatpak install --user --noninteractive flathub "${ids[@]}"
}

# Core: Steam plus the two requested browsers.
install_flatpaks \
  com.valvesoftware.Steam \
  org.mozilla.firefox \
  com.opera.opera-gx \
  com.heroicgameslauncher.hgl \
  net.lutris.Lutris \
  net.davidotek.pupgui2

# Ten additional purpose-specific applications
install_flatpaks org.godotengine.Godot org.blender.Blender com.vscodium.codium org.gnome.Boxes org.gnome.Logs org.gnome.Calculator org.gnome.baobab com.github.tchx84.Flatseal org.gnome.TextEditor org.gnome.Calendar


# Fifteen additional purpose-specific applications
install_flatpaks org.libretro.RetroArch org.DolphinEmu.dolphin-emu org.ppsspp.PPSSPP net.pcsx2.PCSX2 org.mamedev.MAME com.github.Matoking.protontricks org.gnome.gitg org.gnome.Evolution org.mozilla.Thunderbird org.gnome.clocks org.gnome.Extensions org.gnome.Papers org.gnome.Weather org.gnome.Contacts org.gnome.SoundRecorder

# Fifteen further purpose-specific applications
install_flatpaks org.scummvm.ScummVM org.kde.kpat org.kde.kmines org.kde.knights org.kde.ksudoku org.kde.kmahjongg org.kde.kshisen org.kde.kapman org.kde.kgoldrunner org.kde.kjumpingcube org.kde.kfourinline org.kde.kdiamond org.kde.knetwalk org.kde.klickety org.kde.knavalbattle
read -r -p 'Install Bottles as an additional compatibility tool? [y/N] ' answer
if [[ "${answer}" =~ ^[Yy]([Ee][Ss])?$ ]]; then
  install_flatpaks com.usebottles.bottles
fi

read -r -p 'Install creator tools (OBS Studio and VLC)? [y/N] ' answer
if [[ "${answer}" =~ ^[Yy]([Ee][Ss])?$ ]]; then
  install_flatpaks com.obsproject.Studio org.videolan.VLC
fi

if [[ -f "${SCRIPT_DIR}/proxy-os-neon.svg" ]]; then
  sudo install -D -m 0644 "${SCRIPT_DIR}/proxy-os-neon.svg" \
    /usr/share/backgrounds/proxy-os-neon.svg
  if [[ -n "${DBUS_SESSION_BUS_ADDRESS:-}" ]] && command -v gsettings >/dev/null; then
    gsettings set org.gnome.desktop.background picture-uri \
      'file:///usr/share/backgrounds/proxy-os-neon.svg' || true
    gsettings set org.gnome.desktop.background picture-uri-dark \
      'file:///usr/share/backgrounds/proxy-os-neon.svg' || true
  else
    echo 'Wallpaper copied. Select it in Settings → Appearance after logging in to GNOME.'
  fi
fi

# Install local maintenance tools and guides for use after this source folder is moved.
sudo install -D -m 0755 "${SCRIPT_DIR}/proxy-update.sh" /usr/local/bin/proxy-update
sudo install -D -m 0755 "${SCRIPT_DIR}/proxy-gaming-doctor.sh" /usr/local/bin/proxy-gaming-doctor
sudo install -D -m 0755 "${SCRIPT_DIR}/proxy-game-library-check.sh" /usr/local/bin/proxy-game-library-check
sudo install -D -m 0755 "${SCRIPT_DIR}/proxy-launch-options.sh" /usr/local/bin/proxy-launch-options
sudo install -D -m 0755 "${SCRIPT_DIR}/proxy-protondb-search.sh" /usr/local/bin/proxy-protondb-search
sudo install -D -m 0755 "${SCRIPT_DIR}/proxy-game-notes.sh" /usr/local/bin/proxy-game-notes
sudo install -D -m 0755 "${SCRIPT_DIR}/proxy-flatpak-review.sh" /usr/local/bin/proxy-flatpak-review
sudo install -D -m 0755 "${SCRIPT_DIR}/proxy-stream-checklist.sh" /usr/local/bin/proxy-stream-checklist
sudo install -D -m 0755 "${SCRIPT_DIR}/proxy-session-checklist.sh" /usr/local/bin/proxy-session-checklist
sudo install -D -m 0755 "${SCRIPT_DIR}/proxy-toolbox.sh" /usr/local/bin/proxy-toolbox
sudo install -D -m 0755 "${SCRIPT_DIR}/proxy-apps.sh" /usr/local/bin/proxy-apps
sudo install -D -m 0644 "${SCRIPT_DIR}/proxy-os-toolbox.desktop" \
  /usr/share/applications/proxy-os-toolbox.desktop
for app in davinci-resolve chatgpt claude; do
  sudo install -D -m 0644 "${SCRIPT_DIR}/${app}.desktop" "/usr/share/applications/${app}.desktop"
done
sudo install -d -m 0755 /usr/share/doc/proxy-os
sudo install -m 0644 \
  "${SCRIPT_DIR}/README.md" \
  "${SCRIPT_DIR}/APP_STORE.md" \
  "${SCRIPT_DIR}/SECURITY_AND_PRIVACY.md" \
  "${SCRIPT_DIR}/FIRST_RUN.md" \
  "${SCRIPT_DIR}/FEATURES_200.md" \
  "${SCRIPT_DIR}/DAVINCI_RESOLVE.md" \
  "${SCRIPT_DIR}/STREAMING_GUIDE.md" \
  "${SCRIPT_DIR}/CONTROLLER_GUIDE.md" \
  "${SCRIPT_DIR}/GAME_TROUBLESHOOTING.md" \
  "${SCRIPT_DIR}/PROTON_AND_PERFORMANCE.md" \
  "${SCRIPT_DIR}/TROUBLESHOOTING.md" \
  /usr/share/doc/proxy-os/

echo
echo 'Setup finished. Open Software to browse and install more apps from Flathub.'
echo 'For NVIDIA or other proprietary drivers, use Software & Updates → Additional Drivers.'
echo 'Restart after changing a graphics driver. See PROTON_AND_PERFORMANCE.md for game setup.'

# Install this project's three purpose-specific local helper commands.
mkdir -p "$HOME/.local/bin"
install -m 0755 "$(dirname "$0")"/features/* "$HOME/.local/bin/"
echo 'Purpose-specific helper commands are installed in ~/.local/bin.'
