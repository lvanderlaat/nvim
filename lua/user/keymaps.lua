if not vim.g.cmd then
    vim.g.cmd = 'echo "Set a session command: :lua session_cmd(CMD)"'
end

function session_cmd(cmd)
    vim.g.cmd = cmd
    vim.cmd('source ~/.config/nvim/lua/user/keymaps.lua')
end


local opts = {noremap=true, silent=false}

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
 
-- Leader
keymap('', ',', '<Nop>', opts)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Splits navigation: normal
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Splits navigation: terminal
keymap('t', '<C-h>', '<C-w>h', opts)
keymap('t', '<C-j>', '<C-w>j', opts)
keymap('t', '<C-k>', '<C-w>k', opts)
keymap('t', '<C-l>', '<C-w>l', opts)

-- Splits resizing: 
-- keymap('n', '<S-Up>', ':resize +2<CR>', opts)
-- keymap('n', '<S-Down>', ':resize -2<CR>', opts)
-- keymap('n', '<C-_>', ':vertical resize -2<CR>', opts)
-- keymap('n', '<C-=>', ':vertical resize +2<CR>', opts)

-- Tab navigation
keymap('n', '<leader>t', ':tabnew<Space>', opts)
keymap('n', '<leader>x', 'gt', opts)
keymap('n', '<leader>z', 'gT', opts)

-- Save file
keymap('n', '<leader>s', ':w<CR>', opts)
keymap('i', '<leader>s', '<ESC>:w<CR>', opts)

-- Remove last search highlighted results
keymap('', '<C-n>', ':nohl<CR>', opts)
keymap('i', '<C-n>', '<ESC>:nohl<CR>i', opts)

-- Disable arrows
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)

-- Block indentation
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Wrap
keymap('n', '<leader>w', ':set wrap<CR>', opts)
keymap('n', '<leader>n', ':set nowrap<CR>', opts)

-- Search selection
keymap('v', '//', 'y/\\V<C-R>=escape(@",\'/\')<CR><CR>', opts)

-- Yank, as originally in Vim
keymap('n', 'Y', 'yy', opts)

-- Terminal toggles
keymap('n', '<leader>gs', '<Cmd>lua _GIT_SYNC_TOGGLE()<CR>', opts)
keymap('n', '<leader>q', '<Cmd>lua _SQUEUE_TOGGLE()<CR>', opts)
keymap('n', '<leader>l', '<Cmd>lua _LOG_TOGGLE()<CR>', opts)

-- Run the session command
keymap('n', '<leader>r', '<Cmd>w<CR><Cmd>TermExec cmd=\'' .. vim.g.cmd .. '\'<CR>', opts)
keymap('i', '<leader>r', '<ESC><Cmd>w<CR><Cmd>TermExec cmd=\'' .. vim.g.cmd .. '\'<CR>', opts)
keymap('v', '<leader>r', '<ESC><Cmd>ToggleTermSendVisualSelection<CR>', opts)

-- Path completion
keymap('i', '<C-p>', '<C-x><C-f>', opts)

-- Tree
keymap('n', '<leader>tt', '<Cmd>NvimTreeToggle<CR>', opts)
