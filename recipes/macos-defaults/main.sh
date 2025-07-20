# Dock Settings
execute "defaults write com.apple.dock autohide -bool true" # Auto-hide the Dock
execute "defaults write com.apple.dock autohide-delay -float 0" # Remove Dock auto-hide delay
execute "defaults write com.apple.dock autohide-time-modifier -float 0" # Remove Dock auto-hide animation
execute "defaults write com.apple.dock tilesize -int 48" # Set Dock icon size to 48 pixels
execute "defaults write com.apple.dock largesize -int 56" # Set magnified Dock icon size to 56 pixels
execute "defaults write com.apple.dock magnification -bool true" # Enable Dock magnification
execute "defaults write com.apple.dock show-recents -bool false" # Don't show recent applications in Dock
execute "defaults write com.apple.dock wvous-bl-corner -int 5" # Bottom left hot corner: Start screen saver
execute "defaults write com.apple.dock wvous-br-corner -int 1" # Bottom right hot corner: Disable screen saver
execute "defaults write com.apple.dock wvous-bl-modifier -int 0" # No modifier key for bottom left hot corner
execute "defaults write com.apple.dock wvous-br-modifier -int 0" # No modifier key for bottom right hot corner

# Keyboard Settings
execute "defaults write NSGlobalDomain KeyRepeat -int 1" # Set fast key repeat rate (15ms)
execute "defaults write NSGlobalDomain InitialKeyRepeat -int 10" # Set short delay until key repeat (150ms)
execute "defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool true" # Enable automatic capitalization
execute "defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool true" # Enable automatic period substitution

# Trackpad Settings
execute "defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false" # Disable natural scrolling
execute "defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool true" # Enable Force Click
execute "defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2" # Set trackpad tracking speed
execute "defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true" # Enable tap to click for built-in trackpad
execute "defaults write com.apple.AppleMultitouchTrackpad DragLock -bool true" # Enable drag lock for built-in trackpad
execute "defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true" # Enable dragging for built-in trackpad
execute "defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool false" # Disable three finger drag for built-in trackpad
execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true" # Enable tap to click for Bluetooth trackpad
execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool true" # Enable drag lock for Bluetooth trackpad
execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true" # Enable dragging for Bluetooth trackpad
execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool false" # Disable three finger drag for Bluetooth trackpad

# Mouse Settings
execute "defaults write NSGlobalDomain com.apple.mouse.doubleClickThreshold -float 0.2" # Set double-click speed
execute "defaults write NSGlobalDomain com.apple.mouse.scaling -float 1.5" # Set mouse tracking speed
execute "defaults write NSGlobalDomain com.apple.scrollwheel.scaling -float 0.75" # Set scroll wheel speed

# Finder Settings
execute "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true" # Show external drives on desktop
execute "defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false" # Don't show hard drives on desktop
execute "defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true" # Show removable media on desktop
execute "defaults write com.apple.finder ShowSidebar -bool true" # Show Finder sidebar
execute "defaults write com.apple.finder ShowStatusBar -bool false" # Don't show Finder status bar
execute "defaults write com.apple.finder FXPreferredViewStyle -string 'clmv'" # Use column view in Finder by default
execute "defaults write com.apple.finder NewWindowTarget -string 'PfAF'" # New Finder window shows all files
execute "defaults write com.apple.finder DesktopViewSettings -dict-add IconViewSettings -dict-add arrangeBy -string grid" # Arrange desktop icons by grid
execute "defaults write com.apple.finder FK_StandardViewSettings -dict-add IconViewSettings -dict-add arrangeBy -string grid" # Arrange Finder window icons by grid

# Language & Region Settings
execute "defaults write NSGlobalDomain AppleLanguages -array 'ja-JP'" # Set primary language to Japanese
execute "defaults write NSGlobalDomain AppleLocale -string 'ja_JP'" # Set locale to Japan

# Security & Privacy Settings
execute "defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false" # Disable personalized ads

# Accessibility Settings
execute "defaults write com.apple.Accessibility KeyRepeatDelay -float 0.25" # Set accessibility key repeat delay
execute "defaults write com.apple.Accessibility KeyRepeatInterval -float 0.03333333299999999" # Set accessibility key repeat interval

# System UI Settings
execute "defaults write NSGlobalDomain com.apple.springing.enabled -bool true" # Enable spring loading for directories
execute "defaults write NSGlobalDomain com.apple.springing.delay -float 0.5" # Set spring loading delay
execute "defaults write NSGlobalDomain CGDisableCursorLocationMagnification -bool true" # Disable cursor magnification
execute "defaults write com.apple.universalaccess mouseDriverCursorSize -float 3.0" # Set cursor size
execute "defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true" # Jump to clicked position in scroll bar

# Screenshot Settings
execute "defaults write com.apple.screencapture disable-shadow -bool true" # Disable shadow in screenshots

# Spotlight Settings
execute "defaults write com.apple.Spotlight orderedItems -array \
  '{enabled = 1; name = APPLICATIONS;}' \
  '{enabled = 1; name = \"SYSTEM_PREFS\";}' \
  '{enabled = 0; name = PDF;}' \
  '{enabled = 0; name = \"MENU_SPOTLIGHT_SUGGESTIONS\";}' \
  '{enabled = 0; name = BOOKMARKS;}' \
  '{enabled = 0; name = \"EVENT_TODO\";}' \
  '{enabled = 0; name = SPREADSHEETS;}' \
  '{enabled = 0; name = \"MENU_OTHER\";}' \
  '{enabled = 0; name = SOURCE;}' \
  '{enabled = 0; name = TIPS;}' \
  '{enabled = 0; name = DIRECTORIES;}' \
  '{enabled = 0; name = FONTS;}'" # Configure Spotlight search categories

# Apply changes
execute "killall Dock" # Restart Dock to apply changes
execute "killall Finder" # Restart Finder to apply changes
