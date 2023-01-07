-- Automatically install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float{border='rounded'}
        end,
    },
}

return packer.startup(
    function(use)
        use 'wbthomason/packer.nvim'
        -- use 'jiangmiao/auto-pairs' 
        use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end}
        use 'folke/tokyonight.nvim'
        use 'akinsho/toggleterm.nvim'
        use 'tpope/vim-commentary'
        use 'chrisbra/csv.vim'
        use 'vim-scripts/indentpython.vim'
        use 'nvim-tree/nvim-web-devicons'
        use 'nvim-tree/nvim-tree.lua'
        use 'nvim-lualine/lualine.nvim'

        -- LSP
        use 'neovim/nvim-lspconfig'

        -- Telescope
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        
        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"}
        use "p00f/nvim-ts-rainbow"

        -- Syntax Highlight
        use 'numirias/semshi'

        -- Completion
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        -- Snip
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'


        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if PACKER_BOOTSTRAP then
            require('packer').sync()
        end
    end
)

