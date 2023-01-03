require("nvim-lsp-installer").setup {}

require 'lspconfig'.pylsp.setup{
    on_attach = function()
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set('n', 're', vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {buffer=0})
        vim.keymap.set('n', '<leader>gj', vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set('n', '<leader>gk', vim.diagnostic.goto_prev, {buffer=0})
	end,
}
