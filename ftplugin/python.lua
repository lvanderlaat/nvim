local opts = {noremap=true, silent=false}

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Keymaps -- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Folde code
keymap('n', '<space>', 'za', opts)

-- Print something and exit
keymap('n', '<leader>e', 'iprint()<CR>exit()<ESC>kf)i', opts)  
keymap('i', '<leader>e',  'print()<CR>exit()<ESC>kf)i', opts)

-- Modules header
keymap(
    {'n', 'i'},
    '<leader>m',
    '<ESC>ggi#!/usr/bin/env python<CR><CR><CR>\"\"\"<CR>\"\"\"<CR><CR><CR># Python Standard Library<CR><CR># Other dependencies<CR><CR># Local files<CR><CR><CR>__author__ = \'Leonardo van der Laat\'<CR>__email__ = \'laat@umich.edu\'<CR><CR><CR>def main():<CR>return<CR><CR><CR><ESC>iif __name__ == \'__main__\':<CR>main()<ESC>',
    opts
)

----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Options -- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------
vim.opt.filetype = 'on'
vim.opt.colorcolumn = '80'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 79
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.fileformat = 'unix'
vim.opt.commentstring="# %s"
vim.opt.indentLine_char = '┆'
