vim.g.term_command_sequence = 'clear; python -W ignore test.py'

vim.cmd[[
augroup AutoSource
    autocmd!
    autocmd AutoSource BufWritePost <afile> nested source %
augroup END
autocmd! bufwritepost run.lua source %
]]
