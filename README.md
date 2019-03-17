# patch-pve

A simple script to replace subscription repositories with non-subscription repositories, remove the subscription dialog upon login and replace some of the web interface branding.

Please note that this script has not been tested extensively, and as such should be used at your own risk. Feel free to contribute and improve it.

## Installation

```
git clone https://github.com/thelander/patch-pve.git
```

## Usage

```
usage: apply-patch.sh <server>
```

The script will connect as root via SSH and transfer the files in `patch-pve` to the host (and place them in (`/usr/share/patch-pve/`). It'll then add an `apt-get` hook (`99patchpve`) that runs a script (`patch-pve.sh`) when a package is installed to keep the patch applied. The patch will also replace some of the branding located in (`/usr/share/pve-manager/images`).