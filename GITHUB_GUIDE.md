# GitHub copy-and-paste guide (all three install modes)

Download the official Ubuntu Desktop base from [ubuntu.com/download/desktop](https://ubuntu.com/download/desktop).

This folder contains the source project and separate single boot, dual boot, VMware, performance, OBS streaming/recording, troubleshooting, and [200 optional feature catalog](FEATURES_200.md) guides. The catalog lists capabilities to add or enable; they are not all preinstalled. To publish the **source project only**:

1. Sign in to GitHub and choose **New repository**. Name it `proxy-os`. Leave it public or private as you prefer; do not upload an ISO.
2. On the new repository page, choose **Add file → Upload files**.
3. Upload the project source files from this folder: `README.md`, `APP_STORE.md`, `FEATURES_200.md`, `DAVINCI_RESOLVE.md`, `STREAMING_GUIDE.md`, `CONTROLLER_GUIDE.md`, `SECURITY_AND_PRIVACY.md`, `FIRST_RUN.md`, `COPYRIGHTS.md`, `GITHUB_GUIDE.md`, `INSTALL_SINGLE_BOOT.md`, `INSTALL_DUAL_BOOT.md`, `INSTALL_VMWARE.md`, `PROTON_AND_PERFORMANCE.md`, `TROUBLESHOOTING.md`, `customize.sh`, `install.sh`, `proxy-update.sh`, `proxy-gaming-doctor.sh`, `proxy-game-library-check.sh`, `proxy-launch-options.sh`, `proxy-protondb-search.sh`, `proxy-game-notes.sh`, `proxy-flatpak-review.sh`, `proxy-stream-checklist.sh`, `proxy-session-checklist.sh`, `proxy-apps.sh`, `proxy-toolbox.sh`, `proxy-os-toolbox.desktop`, `davinci-resolve.desktop`, `chatgpt.desktop`, `claude.desktop`, `apps.txt`, and `proxy-os-neon.svg`.
Include `GAME_TROUBLESHOOTING.md` in the project files when uploading. Do not upload `.iso`, `.deb`, `.flatpak`, `.flatpakref`, app images, personal backups, screenshots with private details, VMware `.vmx`/`.vmdk` files, or signing keys.
5. Enter the commit message `Improve Proxy OS gaming setup and guides`, then choose **Commit changes**.

Leave the repository without a license file unless you have chosen the reuse rights you want to grant. A public repository without a license does not give the public general permission to reuse its code or artwork.

GitHub will render `README.md` on the repository front page. Its links open each of the three install guides. These docs are ready as separate pages; copy a whole file unchanged if you prefer to paste content using GitHub's **Add file → Create new file** screen instead of uploading.

## Suggested short repository description

```text
Personal Ubuntu-based gaming desktop customization and install guides for single boot, dual boot, and VMware testing.
```

## Suggested About/topics

```text
ubuntu linux gaming gaming-distro flatpak steam firefox opera-gx
```

Keep the generated ISO private for personal testing. Do not publish a modified Ubuntu ISO unless you have completed the redistribution, trademark, and package-license review described in [COPYRIGHTS.md](COPYRIGHTS.md).

Include FEATURES.md and the complete features/ directory when copying this project to GitHub.

