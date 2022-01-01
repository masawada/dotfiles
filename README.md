dotfiles
========

## Pre-installation

The first step is to install Arch Linux on your PC. Download the Arch Linux iso and create a USB installation disk.

```
$ NEW_USERNAME=masawada bash -c "$(curl -fsSL https://dot.masawada.me/scripts/os_install)"
```

If you are using a storage with NVMe, you must specify the `TARGET_DEVICE` option.

```
$ NEW_USERNAME=masawada TARGET_DEVICE=/dev/nvme0n1 bash -c "$(curl -fsSL https://dot.masawada.me/scripts/os_install)"
```

When the installation finishes successfully, the PC will reboot. After reboot, register a SSH key to GitHub. Create a Personal Access Token with `admin:public_key` permission. Run the following command and enter the PAT.

```
$ bash -c "$(curl -fsSL https://dot.masawada.me/scripts/setup_github)"
```

## Installation

Run the following command to install dotfiles

```
$ bash -c "$(curl -fsSL https://dot.masawada.me/install)"
```
