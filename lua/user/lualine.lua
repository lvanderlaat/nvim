require('lualine').setup{
    options={
        theme='jellybeans'
    },
    sections={
        lualine_c={
            {
                function()
                    local parent = vim.fn.expand('%:p:h:t')
                    local name = vim.fn.expand('%:t')
                    if name == '' then return '[No Name]' end
                    return parent .. '/' .. name
                end,
            },
        },
    },
}
