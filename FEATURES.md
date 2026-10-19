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
