# Installation Instructions

## Option 1: Install via APT (recommended)

Add the repository and install in one go:
```bash
curl -fsSL https://ahmedvolks.github.io/clipgrab-dup/apt-setup.sh | sudo bash
```

Or manually:
```bash
curl -fsSL https://ahmedvolks.github.io/clipgrab-dup/KEY.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/clipgrab-dup.gpg
echo "deb [signed-by=/etc/apt/keyrings/clipgrab-dup.gpg] https://ahmedvolks.github.io/clipgrab-dup stable main" | sudo tee /etc/apt/sources.list.d/clipgrab-dup.list
sudo apt update
sudo apt install clipgrab-dup
```

Update later with: `sudo apt update && sudo apt upgrade`

Uninstall: `sudo apt remove clipgrab-dup`

## Option 2: Download .deb directly

Download from the release page and install:
```bash
wget https://github.com/ahmedvolks/clipgrab-dup/releases/download/v3.9.14-dup.1/clipgrab-dup_3.9.14-dup.1_amd64.deb
sudo apt install ./clipgrab-dup_3.9.14-dup.1_amd64.deb
```

## Option 3: AppImage (any Linux x86_64)

```bash
wget https://github.com/ahmedvolks/clipgrab-dup/releases/download/v3.9.14-dup.1/clipgrab-dup_3.9.14-dup.1_x86_64.AppImage
chmod +x clipgrab-dup_3.9.14-dup.1_x86_64.AppImage
./clipgrab-dup_3.9.14-dup.1_x86_64.AppImage
```

## Build from source

```bash
git clone https://github.com/ahmedvolks/clipgrab-dup.git
cd clipgrab-dup
./build.sh
./clipgrab
```
