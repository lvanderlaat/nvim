# neovim configuration

    git clone git@github.com:lvanderlaat/nvim.git ~/.config/nvim

# Setup the sync file

    cd ~/.config/nvim
    chmod u+x git-sync
    git config --bool branch.main.sync true
    ./git-sync

Use the following keymap to run `git-sync`:

    <leader>gs

# LSP

Requires:

    pip3 pip install pyright

or 

    pip install pyright

# Telescope

Requires:

    $ brew install ripgrep

# Semshi: Python highlighting

Requires:

    pip3 install pynvim --upgrade
