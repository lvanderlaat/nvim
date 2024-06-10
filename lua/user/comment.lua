vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.ly"},
    command = "set filetype=lilypond",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lilypond",
    callback = function()
        vim.bo.commentstring = "%% %s"
    end,
})
