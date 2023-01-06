local colorscheme = 'carbonfox'

vim.cmd[[
augroup AutoSource
    autocmd!
    autocmd AutoSource BufWritePost <afile> nested source %
augroup END
autocmd! bufwritepost colorscheme.lua source %
]]

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
