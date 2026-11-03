-- Toggle comment with Space + c in Normal mode
vim.keymap.set('n', '<leader>c', function()
  require('Comment.api').toggle.linewise.current()
end, { noremap = true, silent = true })

-- Toggle comment with Space + c in Visual mode
vim.keymap.set('v', '<leader>c', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { noremap = true, silent = true })
