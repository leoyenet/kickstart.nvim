-- See the kickstart.nvim README for more information
return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      cmdline = {
        view = 'cmdline', -- Show command line in a popup
      },
      messages = {
        view = 'notify', -- Show regular messages as notifications
        view_error = 'popup', -- Show errors in a popup
      },
      presetsd = {
        bottom_search = true, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      { filter = { cmd = 'RunPython' }, view = 'cmdline' }, -- Route :lua to default cmdline

      { filter = { event = 'msg_show', kind = 'confirm' }, skip = true },
      { filter = { event = 'msg_show', kind = 'search_count' }, skip = true },
      { filter = { event = 'lsp', kind = 'progress' }, view = 'mini' },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify', -- OPTIONAL: only if you want nvim-notify view
      { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    config = function(_, opts)
      require('noice').setup(opts)
    end,
  },
}
