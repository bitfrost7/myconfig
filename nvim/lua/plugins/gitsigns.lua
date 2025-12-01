-- plugins/gitsigns.lua

return {
  'lewis6991/gitsigns.nvim',
  -- 在文件类型载入后延迟加载，提高启动速度
  event = 'BufReadPost', 
  config = function()
    -- 获取 gitsigns 模块
    local gs = require('gitsigns')

    gs.setup({
      -- Git 状态符号的自定义配置
      signs = {
        -- ----------------------------------------------------
        -- 使用常见的 Powerline 符号或粗竖线：
        -- 它们会在行号左侧的符号列中以不同颜色显示。
        -- ----------------------------------------------------
        add          = { text = '▎' }, -- 新增行 (默认绿色)
        change       = { text = '▎' }, -- 修改行 (默认蓝色/黄色)
        
        -- 删除行：通常使用一个特殊符号标记删除的位置
        -- ✖/契 是 Nerd Font 符号，如果不支持可以换成 '-'
        delete       = { text = '✖' }, 
        topdelete    = { text = '✖' }, 
        changedelete = { text = '▎' }, -- 修改并删除的混合行
      },
      
      signcolumn = true,         -- 总是显示符号列 (即使没有改动)
      numhl = false,             -- 不高亮行号本身
      linehl = false,            -- 不高亮整行
      word_diff = false,         -- 默认关闭逐词 diff (性能考虑)
      current_line_blame = true, -- 在状态栏显示当前行最近一次提交的作者和时间

      -- ----------------------------------------------------
      -- 关键：键盘操作映射 (用于操作 Git Hunk)
      -- ----------------------------------------------------
      on_attach = function(bufnr)
        local map = vim.keymap.set
        
        -- 使用 [g / ]g 在 Git 改动块 (Hunk) 之间跳转
        map('n', '[g', function() gs.prev_hunk() end, { buffer = bufnr, desc = 'Git: Previous Hunk' })
        map('n', ']g', function() gs.next_hunk() end, { buffer = bufnr, desc = 'Git: Next Hunk' })
        
        -- Leader + g + 字母 (Git 命名空间)
        
        -- 暂存/取消暂存当前改动块
        map('n', '<leader>gs', function() gs.stage_hunk() end, { buffer = bufnr, desc = 'Git: Stage Hunk' })
        map('n', '<leader>gr', function() gs.reset_hunk() end, { buffer = bufnr, desc = 'Git: Reset Hunk' })
        
        -- 暂存/取消暂存整个文件
        map('n', '<leader>gS', function() gs.stage_buffer() end, { buffer = bufnr, desc = 'Git: Stage Buffer' })
        map('n', '<leader>gR', function() gs.reset_buffer() end, { buffer = bufnr, desc = 'Git: Reset Buffer' })
        
        -- 预览改动：在浮动窗口显示当前改动块的原始内容
        map('n', '<leader>gp', function() gs.preview_hunk() end, { buffer = bufnr, desc = 'Git: Preview Hunk' })
        
        -- Blame：显示当前行的 Git 提交信息
        map('n', '<leader>gb', function() gs.blame_line({ full = true }) end, { buffer = bufnr, desc = 'Git: Blame Line' })

        -- Diff：启动一个 Neovim Diff 窗口，对比当前文件和 HEAD 版本
        map('n', '<leader>gd', gs.diffthis, { buffer = bufnr, desc = 'Git: Diff This' })
      end,
    })
  end
}
