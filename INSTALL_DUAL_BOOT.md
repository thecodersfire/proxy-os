# Install Proxy OS beside Windows (dual boot)

Dual boot changes disk partitions and boot configuration. A mistake can make data unavailable. If you need a low-risk way to try Proxy OS, use the VMware guide instead.

## Before you start

1. Make a full backup of important files to a separate device and verify it.
2. If Windows Device Encryption or BitLocker is enabled, save and verify access to the recovery key before changing partitions. If you cannot find the key, stop here.
3. In Windows Disk Management, shrink the Windows volume to create **unallocated space** for Proxy OS. Do not delete or format Windows, EFI, recovery, or OEM partitions. Leave the new space unallocated; do not make a new Windows volume there.
4. Build and test the Proxy OS ISO in VMware before installing it on physical hardware.
5. Create a bootable USB with Rufus. Confirm the selected USB drive is the intended blank installer drive before writing it.

## Install alongside Windows

1. Boot the USB using the computer's UEFI boot menu.
2. Choose **Try Ubuntu** and check Wi-Fi, graphics, sound, and input devices.
3. Start the installer. Choose **Install alongside Windows Boot Manager** only if the installer shows that exact option and identifies the expected Windows installation and free space.
4. Review the partition summary before confirming. If the option is missing, the disk layout looks unfamiliar, or the sizes are unexpected, cancel. Do not choose **Erase disk** and do not use manual partitioning for this guide.
5. Complete installation. Keep the computer connected to power; do not interrupt partitioning.
6. Reboot and confirm the boot menu offers both Proxy OS/Ubuntu and Windows Boot Manager. Test each OS.

## If the installer does not offer “Install alongside”

Stop and ask for help with a screenshot of the installer’s disk/partition screen, with serial numbers and personal information hidden. Do not guess, delete partitions, or run partitioning commands from the internet.
