# GitHub copy-and-paste guide (all three install modes)

This folder already contains four ready-to-publish Markdown files: the main `README.md` and separate single boot, dual boot, and VMware guides. To publish the **source project only**:

1. Sign in to GitHub and choose **New repository**. Name it `proxy-os`. Leave it public or private as you prefer; do not upload an ISO.
2. On the new repository page, choose **Add file → Upload files**.
3. Upload the project source files from this folder: `README.md`, `COPYRIGHTS.md`, `GITHUB_GUIDE.md`, `INSTALL_SINGLE_BOOT.md`, `INSTALL_DUAL_BOOT.md`, `INSTALL_VMWARE.md`, `customize.sh`, `install.sh`, `apps.txt`, and `proxy-os-neon.svg`.
4. Do not upload `.iso`, `.deb`, `.flatpak`, `.flatpakref`, app images, personal backups, screenshots with private details, VMware `.vmx`/`.vmdk` files, or signing keys.
5. Enter the commit message `Add Proxy OS source and install guides`, then choose **Commit changes**.

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
