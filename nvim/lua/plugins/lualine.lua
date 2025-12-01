return {
  "nvim-lualine/lualine.nvim",
  -- 依赖 nvim-web-devicons 来显示文件类型和 Git 图标
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Lualine 配置表
    require('lualine').setup({
      options = {
        -- 启用图标
        icons_enabled = true,
        -- 使用一个流行主题，例如 'tokyonight', 'dracula', 'gruvbox'。
        -- 如果设置为 'auto'，则使用当前 colorscheme 的配色。
        theme = 'dracula', 
        -- 设置 Powerline 风格的分隔符
        component_separators = { left = '', right = ''}, -- 组内组件分隔符
        section_separators = { left = '', right = ''},   -- 左右区块分隔符
        -- 启用全局状态栏（只在 Neovim 0.7+ 有效），只显示一个状态栏在底部
        globalstatus = false,
        -- 总是显示 Tabline（如果您使用了 Tabline 扩展）
        always_show_tabline = true,
      },
      
      -- 活跃状态栏的组件配置
      sections = {
        -- 左侧 A 区：模式
        lualine_a = {'mode'},
        
        -- 左侧 B 区：Git 和诊断信息
        lualine_b = {
          'branch', 
          -- 【优化 Git Diff 显示】
          {
            'diff',
            colored = true,
            symbols = { added = ' ', modified = ' ', removed = ' ' }, 
          },
          'diagnostics'
        },        
        
        -- 左侧 C 区：文件名（通常是状态栏的重点区域）
        lualine_c = {
          -- 优化 filename 组件，显示短路径和图标
          {
            'filename',
            file_status = true,   -- 显示文件状态（只读、修改等）
            path = 1,             -- 显示相对路径 (1: 相对路径, 2: 绝对路径)
            shorten_path = true,  -- 缩短路径
          }
        },
        
        -- 右侧 X 区：文件信息和 LSP 状态
        lualine_x = {
          -- 添加 LSP 状态（显示活跃的 LSP 客户端和进度）
          'lsp_status',
          'filetype',
          'encoding', 
          -- 'fileformat', -- 文件格式通常不太需要，可以注释掉节省空间
        },
        
        -- 右侧 Y 区：进度
        lualine_y = {'progress'},
        
        -- 右侧 Z 区：定位
        lualine_z = {
          'location',
          -- 'searchcount', -- 搜索结果计数，当 hlsearch 开启时很有用
        }
      },

      -- 非活跃状态栏的组件配置（当窗口不活跃时显示的内容）
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'}, -- 非活跃时只显示文件名
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
    })
  end
}
