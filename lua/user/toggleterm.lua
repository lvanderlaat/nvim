local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end


toggleterm.setup({
	size = 90,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "vertical",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal


local python = Terminal:new({cmd="ipython", hidden=true})
function _PYTHON_TOGGLE()
	python:toggle()
end

local terminal_git_sync = Terminal:new{
    cmd='cd ~/.config/nvim; ~/.config/nvim/git-sync',
    hidden=true,
    direction='float',
    close_on_exit=false
}
function _GIT_SYNC_TOGGLE()
    terminal_git_sync:toggle()
end

local terminal_squeue = Terminal:new{
    cmd='watch -n 2 squeue -u laat',
    hidden=true,
    direction='float',
    close_on_exit=false
}
function _SQUEUE_TOGGLE()
    terminal_squeue:toggle()
end

local terminal_tail_log = Terminal:new{
    cmd='watch -n 2 tail -n 30 log',
    hidden=true,
    direction='float',
    close_on_exit=true
}
function _LOG_TOGGLE()
    terminal_tail_log:toggle()
end
