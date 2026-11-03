vim.g.mapleader = " "

vim.keymap.set("n", "=ap", function()
    local view = vim.fn.winsaveview()
    vim.cmd("normal! =ap")
    vim.fn.winrestview(view)
end)

vim.keymap.set("n", "<leader>pv", function()
	vim.cmd("Ex")
end)
-- Exit terminal mode easily by pressing Esc inside the terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

-- --- 1. FILE SPLITS ---
-- Split window horizontally (top/bottom)
vim.keymap.set('n', '<leader>sh', ':split<CR>', { desc = 'Split window horizontally' })
-- Split window vertically (left/right)
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split window vertically' })

-- Open vertical terminal on the right in the current file's directory
vim.keymap.set('n', '<leader>vst', function()
  local current_dir = vim.fn.expand('%:p:h')
  vim.cmd('vsplit')
  vim.cmd('wincmd l')
  vim.cmd('enew') -- Creates a fresh, empty buffer so it doesn't affect your file
  vim.cmd('lcd ' .. current_dir) -- Sets local directory for this window only
  vim.cmd('terminal')
  vim.cmd('startinsert')
end, { desc = 'Vertical terminal in current file dir' })

-- Open horizontal terminal below in the current file's directory
vim.keymap.set('n', '<leader>st', function()
  local current_dir = vim.fn.expand('%:p:h')
  vim.cmd('split')
  vim.cmd('wincmd j')
  vim.cmd('enew') -- Creates a fresh, empty buffer
  vim.cmd('lcd ' .. current_dir) -- Sets local directory for this window only
  vim.cmd('terminal')
  vim.cmd('startinsert')
end, { desc = 'Horizontal terminal in current file dir' })

-- This lets you jump between any split (files or terminal) instantly without getting stuck
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Even when you are inside the terminal, Ctrl+h/j/k/l will jump out to your files automatically!
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { silent = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { silent = true })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { silent = true })
