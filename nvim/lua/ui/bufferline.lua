return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local map = vim.keymap.set 

    require('bufferline').setup({
      options = {
        style_preset = { require('bufferline.groups').tabs },
        numbers = 'none',

        close_command = 'bd %', 

        show_close_icon = true,
        themable_icons = true,

        show_buffer_close_icons = true,
        show_tab_indicators = true,
        show_duplicate_precedence = true,
        diagnostics = 'nvim_lsp',
      },
    })
  end
}

