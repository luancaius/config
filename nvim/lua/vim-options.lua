
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")

vim.g.mapleader = " "
-- Disable Python provider to avoid errors
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Copy relative path to clipboard
vim.keymap.set('n', '<leader>crp', function()
  local path = vim.fn.expand('%:.')
  vim.fn.setreg('+', path)
  print('Copied: ' .. path)
end, { desc = 'Copy relative path' })

-- Copy absolute path to clipboard
vim.keymap.set('n', '<leader>cap', function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  print('Copied: ' .. path)
end, { desc = 'Copy absolute path' })

-- Copy filename to clipboard
vim.keymap.set('n', '<leader>cf', function()
  local path = vim.fn.expand('%:t')
  vim.fn.setreg('+', path)
  print('Copied: ' .. path)
end, { desc = 'Copy filename' })
