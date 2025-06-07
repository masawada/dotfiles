#!/bin/bash

set -euo pipefail

# Detect the operating system platform
OS_TYPE="$(uname -s)"

case "$OS_TYPE" in
    Linux*)
        export PLATFORM="linux"
        export IS_LINUX=1
        export IS_DARWIN=0
        ;;
    Darwin*)
        export PLATFORM="darwin"
        export IS_LINUX=0
        export IS_DARWIN=1
        ;;
    *)
        echo "Unsupported platform: $OS_TYPE" >&2
        exit 1
        ;;
esac

# Platform-specific paths and constants
if [[ "$PLATFORM" == "linux" ]]; then
    # Linux-specific paths
    export SYSTEM_CONFIG_DIR="/etc"
    export SYSTEM_SERVICE_DIR="/etc/systemd/system"
    export SYSTEM_UDEV_RULES_DIR="/etc/udev/rules.d"
    export USER_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
    export USER_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
    export USER_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
    export PACKAGE_MANAGER="pacman"
    export AUR_HELPER="yay"
elif [[ "$PLATFORM" == "darwin" ]]; then
    # macOS-specific paths
    export SYSTEM_CONFIG_DIR="/usr/local/etc"
    export SYSTEM_SERVICE_DIR="$HOME/Library/LaunchAgents"
    export USER_CONFIG_HOME="$HOME/.config"
    export USER_DATA_HOME="$HOME/Library/Application Support"
    export USER_CACHE_HOME="$HOME/Library/Caches"
    export PACKAGE_MANAGER="brew"
    export HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"
fi

# Display platform information (only if DEBUG is set)
if [[ -n "${DEBUG:-}" ]]; then
    echo "Platform detected: $PLATFORM"
    echo "System config directory: $SYSTEM_CONFIG_DIR"
    echo "User config home: $USER_CONFIG_HOME"
    echo "Package manager: $PACKAGE_MANAGER"
fi