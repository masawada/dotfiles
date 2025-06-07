dotfiles
========

Cross-platform dotfiles for Arch Linux and macOS.

## Pre-installation

### Arch Linux

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

### macOS

For macOS, ensure you have the following prerequisites:
1. macOS 10.15 (Catalina) or later
2. Command Line Tools for Xcode (will be installed automatically if missing)
3. SSH key registered to GitHub

## Installation

The installation process works on both Arch Linux and macOS. Run the following command to install dotfiles:

```
$ bash -c "$(curl -fsSL https://dot.masawada.me/install)"
```

The installation script will:
1. Detect your platform automatically
2. Install platform-appropriate package managers (yay for Arch Linux, Homebrew for macOS)
3. Install packages and applications
4. Configure system settings
5. Symlink configuration files
