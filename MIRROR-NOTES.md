# Mirror Notes

This repository mirrors the S-UI version installed by:

```sh
bash <(curl -Ls https://s-ui.alireza0.dev/install.sh)
```

Resolved installer version on 2026-06-06: `v1.4.2`.

The main source tree is checked out from tag `v1.4.2`.

Installer packages are mirrored in this repository under:

```text
downloads/v1.4.2/
```

The Linux, Windows, and management scripts have been updated to download from `zyd614/yuan-s-ui`.

The original frontend submodule URL `https://github.com/alireza0/s-ui-frontend` is no longer accessible, so `.gitmodules` points to an accessible mirror while preserving the exact submodule commit:

```text
a4b88165023003acd8f25c90d4cb395b7f996b50 frontend
```

The source changes in this mirror are limited to repository URLs, installer package URLs, and documentation for the mirror.
