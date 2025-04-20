-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {},
  opts = {
    filesystem = {
      window = {
        mappings = {
          -- Remove the backslash mapping.
          -- This will free up your `\` key (or whatever your <leader> is)
          -- for other mappings. If you want to keep a close window mapping
          -- consider mapping some other key to close_window.
          -- ['\\'] = 'close_window'
        },
      },
    },
  },
  config = function()
    require('neo-tree').setup(require 'neo-tree.defaults')
    -- Now, define your <leader>e mapping *after* Neotree is set up.
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true })
    vim.keymap.set('n', '<leader>o', function()
      if vim.bo.filetype == 'neo-tree' then
        vim.cmd.wincmd 'p'
      else
        vim.cmd.Neotree 'focus'
      end
    end, { desc = 'Toggle Explorer Focus' })
  end,
}
