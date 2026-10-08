# Installation Instructions

## Ubuntu/Debian (Recommended for .deb users)

Download the .deb from the release page:
https://github.com/ahmedvolks/clipgrab-dup/releases/download/v3.9.14-dup.1/clipgrab-dup_3.9.14-dup.1_amd64.deb

Install:
```bash
sudo apt install ./clipgrab-dup_3.9.14-dup.1_amd64.deb
```

Uninstall:
```bash
sudo apt remove clipgrab-dup
```

## AppImage (Linux, any distribution)

Download the AppImage:
https://github.com/ahmedvolks/clipgrab-dup/releases/download/v3.9.14-dup.1/clipgrab-dup_3.9.14-dup.1_x86_64.AppImage

Make it executable and run:
```bash
chmod +x clipgrab-dup_3.9.14-dup.1_x86_64.AppImage
./clipgrab-dup_3.9.14-dup.1_x86_64.AppImage
```

To integrate with your system (optional), you can use [AppImageLauncher](https://github.com/TheAssassin/AppImageLauncher) or move it to a known location and create a desktop entry.

## Other Linux distributions

The AppImage should work on most modern Linux x86_64 systems. Alternatively, build from source.

## Build from source

Clone the repository:
```bash
git clone https://github.com/ahmedvolks/clipgrab-dup.git
cd clipgrab-dup
./build.sh
./clipgrab
```

Requirements (Debian/Ubuntu): `apt-get` available, `g++`, build-essential context; the script downloads Qt dev packages into `/tmp` root-free.

## macOS / Windows

This fork is built/tested primarily on Linux. Upstream ClipGrab provides macOS/Windows builds; this fork's changes (Qt5 C++) are portable, but prebuilt macOS/Windows binaries are not provided in this release. If you need them, build from source using the upstream build instructions adapted to this repo.
