return {
  'nvim-tree/nvim-tree.lua',
  version = '*', -- 推荐使用 latest/main 分支以获取最新功能
  lazy = false,  -- 文件树通常是核心组件，设为立即加载
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- 依赖图标库

  config = function()
    local nvim_tree = require('nvim-tree')

    -- 设置文件树的配置
    nvim_tree.setup({
      -- 禁用侧边栏的 Git 状态图标 (可选，因为它可能会影响性能)
      git = {
        enable = true,
      },
      -- 启用文件类型图标（需要 nvim-web-devicons）
      view = {
        -- 宽度设置为 30
        width = 30,
        -- 窗口位置：左侧
        side = 'left',
        -- 隐藏侧边栏的头部
        signcolumn = 'yes',
      },
      -- 过滤设置：不显示某些文件
      filters = {
        dotfiles = false, -- 默认不显示点文件（如 .git）
        custom = { 'node_modules' }, -- 添加您想隐藏的自定义文件夹
      },
      -- 映射设置
      actions = {
        open_file = {
          -- 双击文件时关闭文件树
          quit_on_open = true,
        },
      },
      -- 自动打开/关闭设置
      -- 默认关闭 Neovim 时如果文件树是唯一窗口，也关闭文件树
      disable_netrw = true,
      hijack_netrw = true,
    })

    -- **自定义按键映射** (在 init.lua 或 keymaps.lua 中添加也可以)
    -- 推荐使用 <leader>e 或 <leader>n 来切换文件树
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
  end
}
