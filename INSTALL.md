# Installation Instructions

## Option 1: Install via apt from a local .deb file (works everywhere)
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

## Option 2: "apt install clipgrab-dup" directly (requires an apt repository)
Running `apt install clipgrab-dup` without a local path only works if you have added an apt repository (PPA, or a custom .deb repo) that hosts this package. This release is distributed as a direct .deb download on GitHub, not published to a PPA yet.

To make `apt install clipgrab-dup` work, you can:
- Use a PPA on Launchpad, or
- Host your own apt repository (e.g. using GitHub Pages + aptly), or
- Use a package manager like `apt-get` with `dpkg` directly as in Option 1.

If you want, tell me whether you prefer Launchpad PPA or GitHub Pages apt repo, and I can set it up.

## AppImage (Linux, any distribution)

Download the AppImage:
https://github.com/ahmedvolks/clipgrab-dup/releases/download/v3.9.14-dup.1/clipgrab-dup_3.9.14-dup.1_x86_64.AppImage

Make it executable and run:
```bash
chmod +x clipgrab-dup_3.9.14-dup.1_x86_64.AppImage
./clipgrab-dup_3.9.14-dup.1_x86_64.AppImage
```

## Build from source

Clone the repository:
```bash
git clone https://github.com/ahmedvolks/clipgrab-dup.git
cd clipgrab-dup
./build.sh
./clipgrab
```
