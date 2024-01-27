# neovim configuration

    git clone git@github.com:lvanderlaat/nvim.git ~/.config/nvim

# Setup the sync file

    cd ~/.config/nvim
    chmod u+x git-sync
    git config --bool branch.main.sync true
    ./git-sync

Use the following keymap to run `git-sync`:

    <leader>gs

# Dependencies

```bash
pip install python-lsp-server     # PyLSP
brew install ripgrep              # Telescope
pip3 install pynvim --upgrade     # Python Highlighting (Shemshi)
```