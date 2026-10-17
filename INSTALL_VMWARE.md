# Install Proxy OS in VMware Workstation Pro

This is the recommended first install because the installer operates on a virtual disk. It should not touch your Windows disk when configured as described below.

## Create the VM

1. Build the Proxy OS ISO and copy it to a folder on the Windows host.
2. In VMware Workstation Pro, select **File → New Virtual Machine → Typical**.
3. Choose **Installer disc image file (ISO)** and browse to `proxy-os-26.04-amd64.iso`.
4. Select Linux and Ubuntu 64-bit if prompted. Name the VM **Proxy OS**.
5. Assign at least 4 CPU cores, 8 GB RAM, and a 60 GB virtual disk if your host has enough resources. Choose a single virtual disk stored as one file or split into files; either is fine.
6. In **VM Settings → Display**, enable 3D acceleration if available. In **Options → Advanced**, keep the normal UEFI firmware setting. Do not add a physical disk to this VM.
7. Start the VM. Choose **Try Ubuntu** and check basic display, keyboard, pointer, and networking.

## Install in the VM

1. Launch the installer in the live session.
2. Choose **Erase disk and install Ubuntu** only after confirming the installer is operating inside this newly created VM. In this setup, “disk” means the VM's virtual disk.
3. Complete installation, reboot the VM, and disconnect the ISO from the virtual CD/DVD drive if it boots back to the installer.
4. Confirm Proxy OS starts from the VM's virtual disk. Check Software, Firefox, Opera GX, and Steam.

Do not enable physical disk passthrough, raw-disk mapping, or shared-folder access to your whole Windows drive. If you want to share project files later, share only the specific project folder.
