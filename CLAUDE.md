# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using Lua. Plugin management via [packer.nvim](https://github.com/wbthomason/packer.nvim). All user config lives under `lua/user/`.

## Setup

```bash
git clone git@github.com:lvanderlaat/nvim.git ~/.config/nvim
chmod u+x git-sync
git config --bool branch.main.sync true
./git-sync
```

Dependencies:

```bash
pip install python-lsp-server   # LSP for Python
pip3 install pynvim --upgrade   # Python syntax highlighting (semshi)
brew install ripgrep            # Telescope grep
```

## Structure

`init.lua` is the entry point — it `require`s each module in `lua/user/` in order:

| Module | Purpose |
|---|---|
| `plugins.lua` | Packer plugin declarations; saving this file triggers `:PackerSync` automatically |
| `lsp.lua` | LSP config for `pylsp` and `julials`; defines `on_attach` with keymaps |
| `completion.lua` | nvim-cmp setup (LSP, buffer, path, cmdline sources) |
| `options.lua` | Core vim options (indent, folding, splits, etc.) |
| `run.lua` | Sets `vim.g.term_command_sequence` — the default command run by `<leader>r` |
| `toggleterm.lua` | Terminal config; defines `_PYTHON_TOGGLE()` (ipython) |
| `telescope.lua` | Custom `find_files`/`live_grep` with addable search paths via `AddSearchPath(path)` |
| `keymaps.lua` | All keybindings; `session_cmd(CMD)` sets the per-session run command |
| `colorscheme.lua` | Tokyonight storm with custom `#0F0F0F` background |
| `lualine.lua` | Status line |
| `snip.lua` | Snippet config (vsnip) |
| `comment.lua` | Comment plugin config |
| `treesitter.lua` | Treesitter config |

`ftplugin/` contains filetype-specific overrides (currently `python.lua` and `yaml.lua`).

## Key Keymaps

Leader key is `,`.

| Key | Action |
|---|---|
| `<leader>r` | Save and run `vim.g.cmd` in a vertical terminal split |
| `<leader>gs` | Run `~/.config/nvim/git-sync` |
| `<leader>ff` | Telescope find files (respects extra search paths) |
| `<leader>fg` | Telescope live grep (respects extra search paths) |
| `<leader>fb` | Telescope buffers |
| `<leader>a` | Toggle nvim-tree |
| `<leader>s` | Save file |
| `<leader>x` | Toggle fold |
| `<C-\>` | Toggle run terminal (vertical split) |
| `<leader>cl` | Toggle Claude terminal (horizontal split below run terminal) |
| `<leader>dd`/`<leader>de` | Disable/enable LSP diagnostics |
| `<leader>f` | LSP format buffer |
| `gd`/`gD`/`gr`/`K` | LSP go-to-definition / declaration / references / hover |

## Session Run Command

`<leader>r` executes whatever is stored in `vim.g.cmd`. Set it per-session with:

```lua
:lua session_cmd("python myscript.py")
```

Default is `python -W ignore test.py` (set in `run.lua`).

## Telescope Search Paths

`CustomFindFiles()` and `CustomLiveGrep()` search `cwd` plus any paths added via:

```vim
:AddSearchPath /some/other/path
:RemoveSearchPath /some/other/path
```

## Plugins

Notable plugins: `tokyonight` (colorscheme), `nvim-tree` (file explorer), `toggleterm` (terminal), `telescope` (fuzzy finder), `nvim-cmp` (completion), `nvim-lspconfig` (LSP), `treesitter` (syntax), `semshi` (Python highlighting), `nvim-lilypond-suite` (LilyPond music notation), `rainbow_csv` (CSV highlighting), `markdown-preview.nvim`.
