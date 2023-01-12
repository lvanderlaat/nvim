-- Set up nvim-cmp.
local cmp = require'cmp'


local kind_icons = {
    Text          = "",
    Method        = "m",
    Function      = "",
    Constructor   = "",
    Field         = "",
    Variable      = "",
    Class         = "",
    Interface     = "",
    Module        = "",
    Property      = "",
    Unit          = "",
    Value         = "",
    Enum          = "",
    Keyword       = "",
    Snippet       = "",
    Color         = "",
    File          = "",
    Reference     = "",
    Folder        = "",
    EnumMember    = "",
    Constant      = "",
    Struct        = "",
    Event         = "",
    Operator      = "",
    TypeParameter = "",
}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert(
        {
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }
    ),
    formatting = {
        fields={"kind", "abbr", "menu"},
        format=function(entry, vim_item)
            vim_item.kind=string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu=(
                {
                    luasnip="[Snip]",
                    buffer="[Buf]",
                    nvim_lsp="[LSP]",
                    nvim_lua="[API]",
                    path="[Path]",
                }
        )[entry.source.name]
        return vim_item
        end,
    },
    sources = cmp.config.sources(
        {
            {name='luasnip' }, -- For luasnip users.
            {name='nvim_lsp'},
            {name='path'},
            -- {name='vsnip'}, -- For vsnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
        },
        {
            {name='buffer'},
        }
    ),
    experimental={ghost_text=true, native_menu=false},
})

-- Set configuration for specific filetype.
cmp.setup.filetype(
    'gitcommit',
    {sources=cmp.config.sources({{name='cmp_git'}}, {{name='buffer'}})
})

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    { '/', '?' },
    {mapping=cmp.mapping.preset.cmdline(), sources={{name='buffer'}}}
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    ':',
    {
        mapping=cmp.mapping.preset.cmdline(),
        sources=cmp.config.sources({{name='path'}}, {{name='cmdline'}})
    }
)
