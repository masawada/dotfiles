# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository with cross-platform support for both Arch Linux and macOS. It uses a modular recipe-based provisioning system with platform detection capabilities. Configuration files are stored in `/config/` and symlinked to the home directory.

## Key Commands

### Provisioning
```bash
# Dry run (preview changes)
./scripts/provision

# Actually provision the system
RUN=1 ./scripts/provision

# Debug mode
DEBUG=1 RUN=1 ./scripts/provision
```

### Testing Changes
Since this is a system configuration repository, testing typically involves:
1. Running provision in dry-run mode to preview changes
2. Checking specific configuration files after symlinking
3. Reloading affected services/applications

## Architecture

### Core Structure
- `/config/` - Configuration files (symlinked to ~/)
- `/recipes/` - Modular installation scripts (executed in order)
- `/lib/` - Core provisioning functions
- `/scripts/` - High-level scripts (os_install, provision)
- `/bin/` - Custom utility commands

### Provisioning Flow
1. `scripts/provision` loads `lib/provision.sh`
2. `lib/provision.sh` sources all libraries and executes recipes in order
3. Each recipe uses helper functions from `lib/recipe_helpers.sh`

### Key Helper Functions
- `package()` - Cross-platform package installation (pacman on Linux, brew on macOS)
- `aur()` - Install from AUR (Linux only)
- `brew_cask()` - Install macOS applications via Homebrew Cask (macOS only)
- `platform_is()` - Check current platform (usage: `if platform_is darwin; then ... fi`)
- `dotfile()` - Symlink from config/ to home
- `system_file()` - Install system config files
- `execute()`/`execute_su()` - Run commands with dry-run support

### Adding New Components
1. Create a recipe in `/recipes/` (numbered for ordering)
2. Use helper functions for installations and configurations
3. Test with dry-run before applying

## Platform-Specific Information

### Platform Detection
- The system automatically detects the platform using `lib/platform.sh`
- Platform-specific behavior is handled through the `platform_is()` function
- Supported platforms: `linux` (Arch Linux) and `darwin` (macOS)

### Linux-Specific Components
- Window Manager: Hyprland (Wayland)
- Package Managers: pacman, yay (AUR)
- Audio: PulseAudio
- Services: systemd

### macOS-Specific Components
- Package Manager: Homebrew
- Terminal: iTerm2
- Window Management: Rectangle
- Launcher: Alfred
- System Preferences: Configured via defaults commands

## Important Configuration Files
- `/config/config/hypr/hyprland.conf` - Wayland compositor config (Linux)
- `/config/vim/rc/` - Vim configuration
- `/config/config/xremap/config.yml` - Keyboard remapping (Linux)
- `/config/zshrc`, `/config/zsh/` - Shell configuration