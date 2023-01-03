local options = {
    encoding='utf-8',

    -- Line numbering --
    number=true,
    relativenumber=true,
    cursorline=true,

    -- Splits --
    splitbelow=true,
    splitright=true,

    -- Indentation --
    tabstop=4,
    softtabstop=4,
    shiftwidth=4,
    expandtab=true,

    -- Braces --
    showmatch=true,

    -- Folding
    foldmethod='indent',
    foldlevel=99,

    -- Backspace behaviour
    backspace='2', -- indent,eol,start

    -- Wrap
    wrap=false,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
