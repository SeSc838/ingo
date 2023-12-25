# ingo
A simple and small go installer and updater for linux

## WARNING
Usage on own risk. Currently no all architecture types are implemented only: 
  - `x86_64` -> `amd64`
  - `x86` -> `386`

## Installation
1. Make `ingo` file executable with:
```bash
sudo chmod +x ingo
```

2. [OPTIONAL] Install `ingo` to your path, by default `make` will copy it to `/usr/bin`:
```bash
make
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
