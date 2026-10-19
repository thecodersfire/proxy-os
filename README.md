# Proxy OS

Proxy OS is a personal Ubuntu-based gaming desktop project. It adds the GNOME Software app store with Flathub, Steam, Firefox, Opera GX, Vulkan support, optional Heroic/Lutris/Bottles/ProtonUp-Qt, optional OBS/VLC, GameMode, MangoHud, diagnostics, ChatGPT and Claude web shortcuts, a DaVinci Resolve download shortcut, and an original neon corridor wallpaper.

**Download the official Ubuntu Desktop base:** [ubuntu.com/download/desktop](https://ubuntu.com/download/desktop)

The wallpaper is original geometric SVG artwork. The reference picture supplied in chat is not included or copied. The project contains no bundled third-party logos or application binaries.

## Pick an installation guide

- [Single boot: replace the selected disk](INSTALL_SINGLE_BOOT.md)
- [Dual boot: install alongside Windows](INSTALL_DUAL_BOOT.md)
- [VMware Workstation Pro](INSTALL_VMWARE.md)
- [Proton, controllers, GameMode, and MangoHud](PROTON_AND_PERFORMANCE.md)
- [Controller connection and troubleshooting](CONTROLLER_GUIDE.md)
- [Using the app store](APP_STORE.md)
- [Safe setup and privacy](SECURITY_AND_PRIVACY.md)
- [First-run checklist](FIRST_RUN.md)
- [200 optional features catalog](FEATURES_200.md)
- [DaVinci Resolve installation notes](DAVINCI_RESOLVE.md)
- [OBS streaming and recording guide](STREAMING_GUIDE.md)
- [Troubleshooting](TROUBLESHOOTING.md)
- [Safe game troubleshooting](GAME_TROUBLESHOOTING.md)
- [GitHub copy-and-paste guide](GITHUB_GUIDE.md)
- [Copyright and third-party software notes](COPYRIGHTS.md)

## Install on an existing Ubuntu desktop

Open a terminal in this folder and run:

```bash
bash install.sh
```

The script checks that it is running on 64-bit Ubuntu, installs GNOME Software and Flathub support, Vulkan/Mesa packages, Steam controller rules, GameMode, and MangoHud. Steam, Firefox, and Opera GX are installed as per-user Flatpaks. The script asks before installing the extra game launchers/ProtonUp-Qt and creator apps. It does not automatically select a proprietary graphics driver or change partitions, firewall rules, overclocking, kernel parameters, or persistent power settings.

Open **Software** to browse Flathub. Run `./proxy-update.sh` to update Ubuntu and the current user's Flatpak apps. Run `./proxy-gaming-doctor.sh` to print read-only diagnostics locally; the script does not send them anywhere. Review diagnostics before sharing because they can show hardware details.

After setup, **Proxy OS Toolbox** appears in the app menu. It opens the app store, update helper, local diagnostics, ProtonDB, included guides, an optional-app menu, a read-only game-library storage check, a per-game Steam launch-option helper, a ProtonDB title search, local game notes, a Flatpak permission viewer, the OBS recording/streaming guide, a pre-stream privacy checklist, and a pre-game readiness checklist. Both checklists run locally and do not save answers or send data. The storage check reports detected Steam library locations, filesystem type, and free space without changing files or sending data. The launch helper prints optional GameMode/MangoHud lines but never edits Steam settings. The ProtonDB helper opens its search URL in your browser after you enter a title. Game notes are saved locally under `~/.local/share/proxy-os/` and are not transmitted. The Flatpak viewer displays the selected app's permission metadata locally without changing it. See [APP_STORE.md](APP_STORE.md) for installing, updating, and removing apps, and [SECURITY_AND_PRIVACY.md](SECURITY_AND_PRIVACY.md) for safe setup guidance.

ChatGPT and Claude appear as web shortcuts in the app menu and open their official websites in your browser. DaVinci Resolve appears as a shortcut to Blackmagic Design's official Linux download page; install it from the publisher and check compatibility notes in [DAVINCI_RESOLVE.md](DAVINCI_RESOLVE.md).

## Build a bootable ISO

This repository contains source customization files, not a finished ISO. Download an official Ubuntu Desktop ISO from the link above. On an Ubuntu desktop, install [Cubic](https://github.com/PJ-Singh-001/Cubic/wiki/Install-Cubic), follow its current instructions, and use a fresh Ubuntu ISO as the source. In Cubic, copy `proxy-os-neon.svg` into `/usr/share/backgrounds/` and run `customize.sh` in Cubic's chroot terminal. The script installs the app store, graphics support, and drivers from Ubuntu repositories, while leaving Flatpak application installs for the first login. Do not ignore package errors.

Keep Ubuntu's internal `ID=ubuntu`, package sources, and update identity intact. The customization changes only the visible display name and wallpaper. Use an output name such as `proxy-os-26.04-amd64.iso`. Test the ISO in a VM before considering a physical install.

## Gaming expectations

Steam Play/Proton must be enabled in Steam settings. Game compatibility varies by title, anti-cheat, DRM, hardware, and updates; check [ProtonDB](https://www.protondb.com/) before relying on a game. VMware's virtual graphics are for desktop testing and are not a substitute for native gaming. Proprietary GPU drivers should be selected through Ubuntu's **Software & Updates → Additional Drivers** screen when needed.

## Copyright and redistribution

Keep this GitHub project to its original artwork, scripts, and documentation; do not upload Ubuntu ISOs, Flatpak bundles, vendor packages, or proprietary binaries. A modified Ubuntu image requires careful license and trademark review before redistribution. Proxy OS is a personal customization and is not an official Ubuntu, Canonical, Mozilla, Valve, or Opera product. See [COPYRIGHTS.md](COPYRIGHTS.md).

## Purpose-specific built-in tools

See [FEATURES.md](FEATURES.md) for three local tools included for general productivity.


The installer also includes three purpose-specific applications: **LibreOffice, GNOME Calendar, KeePassXC**. See [FEATURES.md](FEATURES.md).

The installer also includes three purpose-specific applications: **Prism Launcher, Blender, GIMP**. See [FEATURES.md](FEATURES.md).

The installer also includes three purpose-specific applications: **Heroic Games Launcher, Lutris, ProtonUp-Qt**. See [FEATURES.md](FEATURES.md).
