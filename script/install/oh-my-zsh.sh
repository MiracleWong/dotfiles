#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

main() {

    print_in_purple "\n • Oh-My-Zsh\n\n"

    if [ ! -d $HOME/.oh-my-zsh ]; then
        local tmpFile=""
        tmpFile="$(mktemp /tmp/XXXXX)"
        download "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" "$tmpFile"
        execute \
            "sh $tmpFile" \
            "Install oh-my-zsh"
        rm -rf "$tmpFile"

        execute \
            "sudo chsh -s $(which zsh)" \
            "Set zsh as default"

        execute \
            "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" \
            "Install zsh-autosuggestions"
      
        execute \
            "ln -fs $(pwd)/../home/.zshrc $HOME/.zshrc" \
            "update .zshrc"
    else
        echo "oh-my-zsh is already installed, please check it."
    fi
}


main
