-- lua/config/keybinds.lua

local km = vim.keymap

km.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true })
km.set('n', '<leader>l', '<cmd>source %<CR>')
km.set('n', '<leader>x', ':.lua<CR>', { desc = 'start lua code', silent = true })
km.set('v', '<leader>x', ':lua<CR>', { desc = 'start lua code', silent = true })
km.set('n', '<leader>w', ':w<CR>', { desc = 'Save file', silent = true })
km.set('n', '<leader>rc', ':e $MYVIMRC<CR>', { desc = 'Opens vimrc file', silent = true })
km.set('n', '<leder>rp', ':RunPython<CR>', { desc = 'run Python file', silent = true })
vim.keymap.set('n', '<leader>rr', ':LspRestart<CR>', { desc = 'LSP: Restart client for current buffer' })

-- Function to move line down
local function move_line_down()
  vim.cmd 'm +1'
end

-- Function to move line up
local function move_line_up()
  vim.cmd 'm -2' -- move current line two lines up from current position
end

-- Map Alt+j to move line down in Normal mode
km.set('n', '<A-j>', ':lua move_line_down()<CR>', { noremap = true, silent = true })
km.set('n', '<A-k>', ':lua move_line_up()<CR>', { noremap = true, silent = true })
km.set('v', '<A-j>', ":m '>+1<CR>", { noremap = true, silent = true })
km.set('v', '<A-k>', ":m '<-2<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    if vim.fn.bufname '' ~= '' then
      vim.api.nvim_command [[command! RunPython !python3 %]]
    else
      vim.api.nvim_command [[command! RunPython echo "Cannot run Python: buffer has no file name"]]
    end
  end,
  group = vim.api.nvim_create_augroup('python_runner', { clear = true }),
})
-- print('\nname: ' .. vim.fn.input 'What is your name: ')
-- print(vim.fn.confirm('Are you retarded? ', '&Yes\n&No\n&Are you', 'Question'))
print(vim.fn.getline '.')

-- local full_path = vim.fn.expand '%:p'
-- local file_name = vim.fn.expand '%:t'
-- local folder_path = vim.fn.expand '%:h'
--
-- print '--- File Path Info ---'
-- print('Full Path:', full_path)
-- print('File Name:', file_name)
-- print('Folder Path:', folder_path)
-- print '----------------------'
