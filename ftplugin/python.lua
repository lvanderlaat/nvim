local opts = {noremap=true, silent=false}

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Keymaps -- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fold code
-- keymap('n', '<space>', 'za', opts)

-- Print something and exit
keymap('n', '<leader>e', 'iprint()<CR>exit()<ESC>kf)i', opts)  
keymap('i', '<leader>e',  'print()<CR>exit()<ESC>kf)i', opts)

-- Modules header
keymap(
    {'n', 'i'},
    '<leader>m',
    '<ESC>ggi#!/usr/bin/env python<CR><CR><CR>\"\"\"<CR>\"\"\"<CR><CR><CR># Python Standard Library<CR><CR># Other dependencies<CR><CR># Local files<CR><CR><CR>__author__ = \'Leonardo van der Laat\'<CR>__email__ = \'lvmzxc@gmail.com\'<CR><CR><CR>def main():<CR>return<CR><CR><CR><ESC>iif __name__ == \'__main__\':<CR>main()<ESC>',
    opts
)

----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Options -- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------

vim.opt.filetype = 'on'
vim.opt_local.colorcolumn = '80'
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.textwidth = 79
vim.opt_local.expandtab = true
vim.opt_local.autoindent = true
vim.opt_local.fileformat = 'unix'
vim.opt.commentstring="# %s"
-- vim.opt.indentLine_char = '┆'
