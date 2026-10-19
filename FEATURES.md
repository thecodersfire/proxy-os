# Built-in features for Proxy-OS

Purpose: gaming desktop and game compatibility

1. **prepare a gaming workspace** — run proxy-os-workspace. It creates ~/Documents/proxy-os-workspace/ with Game Notes, Screenshots, Session Plans folders.
2. **record a gaming session plan** — run proxy-os-plan to open a purpose-specific Markdown plan, saved under ~/Documents/proxy-os-session-plans/.
3. **run a game-start checklist** — run proxy-os-check for an interactive checklist. Answers are not saved or transmitted.

These local tools create folders, open a local note, or display prompts. They do not install packages, change system settings, or send data.

Install them from this repository:

    mkdir -p "$HOME/.local/bin"
    install -m 0755 features/proxy-os-workspace features/proxy-os-plan features/proxy-os-check "$HOME/.local/bin/"

## Preinstalled purpose software

The installer adds these three Flathub applications for gaming desktop and game compatibility:

1. **Heroic Games Launcher** — com.heroicgameslauncher.hgl
2. **Lutris** — net.lutris.Lutris
3. **ProtonUp-Qt** — net.davidotek.pupgui2

They are installed from Flathub during setup. The repository contains application IDs and documentation, not third-party binaries; each publisher’s terms and licenses apply.

## Ten more purpose-specific preinstalled applications

The setup installs these ten Flathub apps selected for gaming desktop and game compatibility:

1. **Godot Engine** — build and test 2D and 3D games (org.godotengine.Godot)
2. **Blender** — create 3D assets and animations (org.blender.Blender)
3. **VSCodium** — edit code and project files (com.vscodium.codium)
4. **GNOME Boxes** — test workflows in virtual machines (org.gnome.Boxes)
5. **GNOME Logs** — inspect logs during troubleshooting (org.gnome.Logs)
6. **GNOME Calculator** — perform scientific and financial calculations (org.gnome.Calculator)
7. **Disk Usage Analyzer** — find large files and manage storage (org.gnome.baobab)
8. **Flatseal** — review Flatpak app permissions (com.github.tchx84.Flatseal)
9. **GNOME Text Editor** — edit plain-text notes and configuration files (org.gnome.TextEditor)
10. **GNOME Calendar** — schedule sessions, deadlines, and events (org.gnome.Calendar)

Flathub distributes the app packages. Check each publisher license and terms. This repository contains app IDs and documentation, not third-party binaries.
