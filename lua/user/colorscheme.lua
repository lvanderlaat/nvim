local colorscheme = 'nightfox'

-- nightfox
-- carbonfox
-- duskfox
-- terafox
-- nordfox
-- dayfox
-- dawnfox

vim.cmd[[
augroup AutoSource
    autocmd!
    autocmd AutoSource BufWritePost <afile> nested source %
augroup END
autocmd! bufwritepost colorscheme.lua source %
]]



-- Default options
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = true,   -- Non focused panes set to alternative background
    module_default = true,  -- Default enable value for modules
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = true,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
    palettes = {
        -- nightfox={
        --     -- blue = { base = "#4d688e", bright = "#4e75aa", dim = "#485e7d" },
        --     -- bg0='#141A23',
        --     -- bg1 = "#2e3440",
        -- },
        nightfox = {
          bg1 = "#000000", -- Black background
          bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
          bg3 = "#121820", -- 55% darkened from stock
          sel0 = "#131b24", -- 55% darkened from stock
        },
    },
  specs = {},
  groups = {},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
