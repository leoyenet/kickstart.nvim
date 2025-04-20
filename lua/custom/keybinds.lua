-- lua/config/keybinds.lua

local km = vim.keymap -- Shorten the name

km.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true })
km.set('n', '<leader>l', '<cmd>source %<CR>')
km.set('n', '<leader>x', ':.lua<CR>')
km.set('v', '<leader>x', ':lua<CR>')
print 'Keybinds Loaded' -- Confirm the file is loaded.

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  command = [[command! RunPython !python3 %]],
  group = vim.api.nvim_create_augroup('python_runner', { clear = true }),
})

-- local full_path = vim.fn.expand '%:p'
-- local file_name = vim.fn.expand '%:t'
-- local folder_path = vim.fn.expand '%:h'
--
-- print '--- File Path Info ---'
-- print('Full Path:', full_path)
-- print('File Name:', file_name)
-- print('Folder Path:', folder_path)
-- print '----------------------'
