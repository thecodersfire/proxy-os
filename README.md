# Proxy OS

Proxy OS is a personal Ubuntu-based gaming desktop customization. It adds an app-store catalog, Steam, Heroic, Lutris, Bottles, Firefox, Opera GX, Vulkan support, and an original neon corridor wallpaper.

The wallpaper is a new SVG created for this project from geometric shapes and gradients. The supplied reference image is not included or copied into the project. No third-party logos are included.

## Choose your install guide

- [Single boot: use the whole virtual or physical disk](INSTALL_SINGLE_BOOT.md)
- [Dual boot: install beside an existing operating system](INSTALL_DUAL_BOOT.md)
- [VMware Workstation Pro](INSTALL_VMWARE.md)
- [GitHub copy-and-paste guide for all three](GITHUB_GUIDE.md)
- [Copyright and third-party software notes](COPYRIGHTS.md)

## Build the ISO

This project contains the customization inputs, not a finished ISO. Build from a fresh official Ubuntu 26.04 LTS Desktop ISO on an Ubuntu 26.04 desktop using the Cubic ISO Creator. Follow the [Cubic installation guide](https://github.com/PJ-Singh-001/Cubic/wiki/Install-Cubic).

In Cubic, use its file-copy control to place `proxy-os-neon.svg` at `/usr/share/backgrounds/proxy-os-neon.svg`. Copy `customize.sh` into the chroot and run it in Cubic's terminal. If GNOME Software's Flatpak integration or system Flatpak setup fails in Cubic's chroot, stop and build a base ISO first; use the post-install setup script after installing instead. Do not ignore package errors.

Choose an output name such as `proxy-os-26.04-amd64.iso`. Keep Ubuntu's internal ID as `ubuntu` so Ubuntu package sources and updates continue to work. The script changes only the display name to Proxy OS.

## Important limits

Use the image for personal testing unless and until you have completed the applicable package-license, trademark, and redistribution review. Canonical's policy distinguishes personal modification from redistribution of a modified Ubuntu image. Do not upload a generated ISO to GitHub or represent Proxy OS as an official Ubuntu or Opera product. See [COPYRIGHTS.md](COPYRIGHTS.md).

The physical dual-boot route can modify disk partitions. Back up important files first, use the installer's automatic **Install alongside** option only when it clearly identifies the intended disk and space, and stop if it does not. This project does not promise compatibility with every PC or game.
