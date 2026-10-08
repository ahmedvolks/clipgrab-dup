# clipgrab-dup - Product Information

## Overview
clipgrab-dup is a fork of ClipGrab 3.9.14 that adds duplicate-download detection and several reliability improvements to the bundled youtube-dlp engine. It helps avoid creating "(2)", "(3)" copies when re-downloading videos and surfaces real error messages when downloads fail.

## Version
v3.9.14-dup.1

## Release Date
2026-10-07

## License
GPLv3 (same as upstream ClipGrab)

## Features
- **Duplicate detection**: Warns before downloading if target file exists or if same URL is already queued; lets you confirm or cancel; shows copyable file path.
- **Copy file path**: Context menu action to copy the downloaded file's path to clipboard.
- **Real error messages**: Displays actual youtube-dlp ERROR: lines in the download list and info box.
- **One-click yt-dlp update**: "Update youtube-dlp now" button in About tab; minimum version raised to 2026.01.01.
- **Browser cookies**: Settings > Network allows using cookies from Firefox/Chrome/Chromium/Edge/Brave/Opera/Vivaldi (--cookies-from-browser).
- **Format fallback**: Improved format selection with fallback to best available format when preferred format is unavailable.

## Supported Platforms (prebuilt)
- **Linux x86_64 (amd64)**: .deb package for Ubuntu/Debian and other deb-based distros; AppImage for any modern Linux distribution.

## Compatibility Notes
- .deb requires Qt5 runtime libraries (installed automatically as dependencies on Ubuntu/Debian).
- AppImage bundles Qt5 and QtWebEngine components; may require FUSE or use --no-fuse depending on system configuration.
- Uses youtube-dlp under the hood; functionality depends on youtube-dlp supporting the target site.
