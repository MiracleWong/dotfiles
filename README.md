# dotfiles
Manage my dotfiles by rcm.
通过 `rcm` 命令管理自己`.`文件(dotfiles)


## 1. Install XCode
```
sudo softwareupdate -i -a
xcode-select --install
```

## 2. Install
```
cd ~
git clone https://github.com/coderzh/dotfiles dotfiles
cd dotfile; sh setup.sh
```

## 3. rcup .rcrc file
```
env RCRC=$HOME/dotfiles/tag-rcm/rcrc rcup -t rcm
```

## 4. rcup other config files
```
rcup
```