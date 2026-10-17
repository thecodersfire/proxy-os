# Install Proxy OS as the only OS

This guide is for a **dedicated computer or disk** where you want Proxy OS to replace the current operating system. The erase option removes files and operating systems from the selected disk.

## Before you start

1. Back up files you want to keep to a different physical drive or cloud account. Open a few backup files to confirm the copy works.
2. Build the Proxy OS ISO by following the main [README](README.md). Use the official Ubuntu ISO as the Cubic source.
3. Test the generated ISO in VMware first using [INSTALL_VMWARE.md](INSTALL_VMWARE.md).
4. Use a blank USB drive of at least 8 GB; writing the installer erases that USB drive.
5. On Windows, create the installer with Rufus using the Proxy OS ISO. Select GPT/UEFI unless your computer is specifically configured for legacy BIOS. Confirm the USB drive selected in Rufus is the one you intend to erase.

## Install

1. Restart the target computer and open its one-time boot menu (often F12, F10, Esc, or a manufacturer-specific key). Select the USB entry marked UEFI.
2. Choose **Try Ubuntu** first. Test the display, Wi-Fi, keyboard, trackpad, sound, and network. The installer may still say Ubuntu; Proxy OS changes the installed system's display name.
3. Start the installer. When asked about installation type, select **Erase disk and install Ubuntu** only if you intend to erase the entire selected disk and have a verified backup.
4. Carefully check the disk model and size shown. If it is not the dedicated target disk, cancel. Never select a Windows/system/data disk you need to keep.
5. Continue the installer, create your user account, remove the USB when prompted, and reboot.
6. Open **Settings → System → About** and confirm the system name shows Proxy OS. Launch Software, Firefox, Opera GX, and Steam.

If you are uncertain which disk is selected, cancel the installer. Do not proceed on the assumption that the installer picked the right drive.
