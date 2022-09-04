# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# 关闭开机 Duang~ 的声音
# sudo nvram SystemAudioVolume=" "

# 菜单栏: 电池显示百分百
defaults write com.apple.menuextra.battery -bool true

# 自动隐藏和显示Dock
defaults write com.apple.dock autohide -bool true

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# 完全键盘控制
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# 支持长按连续输入
defaults write NSGlobalDomain KeyRepeat -int 3

# 禁止自动拼写纠正
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder 显示状态栏
defaults write com.apple.finder ShowStatusBar -bool true

# Finder 显示地址栏
defaults write com.apple.finder ShowPathbar -bool true

# 禁止在网络驱动器上生成 .DS_Store 文件
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# 禁止长按连续输入
defaults write -g ApplePressAndHoldEnabled -bool false

# 设置日期时间格式为 24 小时制
defaults write com.apple.menuextra.clock "DateFormat" "EEE MMM d  H:mm"

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Address Book" "Calendar" "Contacts" "Dock" "Finder" "Mail" "Safari" "SystemUIServer" "iCal"; do
    killall "${app}" &> /dev/null
done
