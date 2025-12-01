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
    
    -- **键盘映射**
    -- [TAB] [SHIFT+TAB] 上个/下个标签
    map('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next Buffer' })
    map('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Prev Buffer' })
    -- [LD+bc] 关闭标签
    map('n', '<leader>bc', '<Cmd>bd<CR>', { desc = 'Buffer: Close current buffer' })
    -- [LD 1-9 选择1-9标签]
    for i = 1, 9 do
        map('n', vim.g.mapleader .. i, '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>', { desc = 'Go to Buffer ' .. i })
    end
  end
}

