# ingo
A simple and small go installer and updater for linux

## WARNING
Usage on own risk. Currently no all architecture types are implemented only: 
  - `x86_64` -> `amd64`
  - `x86` -> `386`
  - `aarch64` -> `arm64`

## Installation
1. Clone this repo and change into it:
```bash
git clone https://github.com/SeSc838/ingo.git
cd ingo
```

2. Make `install_ingo.sh` file executable with:
```bash
sudo chmod +x install_ingo.sh
```

3. Install `ingo` to your path, by default a symlink to `ingo.sh` will be created in `/usr/bin` this needs `sudo` rights:
```bash
./install_ingo.sh
```

## Usage
To install or update go on linux simply run the following if you installed `ingo` to your path as above:
```
# ingo <go-version>
ingo 1.21.5  
```

Or if `ingo` is not in your path:
```bash
# <path-to-ingo>/ingo <go-version> for example
~/ingo 1.21.5
```
