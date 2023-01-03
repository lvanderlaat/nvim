local colorscheme = 'gruvbox'

-- nightfox, duskfox, terafox, nordfox, carbonfox
-- tokyonight-night, tokyonight-storm, tokyonight-moon

-- Gruvbox
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_contrast_light = 'hard'
vim.opt.background = 'dark'


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
