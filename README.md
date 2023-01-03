# neovim configuration

    git clone git@github.com:lvanderlaat/nvim.git ~/.config/nvim
    cd ~/.config/nvim
    chmod u+x git-sync
    git config --bool branch.main.sync true

# Don't forget to keep the configuration in sync!

    <leader>gs

# Background color too dim
Change the `~/.local/share/nvim/site/packer/start/gruvbox/colors/gruvbox.vim` line 89

    let s:gb.dark0_hard  = ['#1d2021', 234]     " 29-32-33
to
    let s:gb.dark0_hard  = ['#000000', 000]     " 29-32-33
