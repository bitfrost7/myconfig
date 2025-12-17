local opt = vim.opt

-- ====================================================================
-- 1. 编码与文件处理 (Encoding & Files)
-- ====================================================================
opt.encoding = "utf-8"          -- 内部编码
opt.fileencoding = "utf-8"      -- 文件保存编码
opt.backup = false              -- 不创建备份文件
opt.writebackup = false         -- 不在写入前备份
opt.swapfile = false            -- 不创建交换文件
opt.autoread = true             -- 外部修改自动加载
opt.hidden = true               -- 允许隐藏被修改的 buffer

-- ====================================================================
-- 2. 显示与界面 (UI & Display)
-- ====================================================================
opt.number = true               -- 显示行号
opt.relativenumber = true       -- 相对行号
opt.cursorline = true           -- 高亮当前行
opt.cursorcolumn = true         -- 高亮当前列
opt.signcolumn = "yes"          -- 始终显示左侧图标列
opt.wrap = false                -- 禁止折行
opt.cmdheight = 1               -- 底部命令行高度
opt.pumheight = 10              -- 补全菜单最大高度
opt.scrolloff = 8               -- 上下滚动保留行数
opt.sidescrolloff = 8           -- 左右滚动保留列数
opt.termguicolors = true        -- 开启 24 位真彩色
opt.background = "dark"         -- 默认深色背景
opt.list = false                -- 不显示不可见字符
opt.listchars = "space:·,tab:>-" 
opt.shortmess:append("c")       -- 减少自动补全时的消息提示
opt.laststatus = 3				-- 开启全局状态栏

-- ====================================================================
-- 3. 缩进与排版 (Indentation & Tabs)
-- ====================================================================
opt.tabstop = 4                 -- Tab 显示为 4 个空格
opt.shiftwidth = 4              -- 缩进宽度为 4
opt.softtabstop = 4             -- 按 Tab 插入 4 空格
opt.expandtab = true            -- 将 Tab 转为空格
opt.shiftround = true           -- 缩进对齐到 shiftwidth 的倍数
opt.autoindent = true           -- 自动对齐上一行
opt.smartindent = true          -- 智能缩进

-- ====================================================================
-- 4. 搜索与匹配 (Search)
-- ====================================================================
opt.ignorecase = true           -- 搜索忽略大小写
opt.smartcase = true            -- 搜索包含大写时切换为大小写敏感
opt.hlsearch = false            -- 禁用搜索高亮
opt.incsearch = true            -- 边输入边显示匹配结果

-- ====================================================================
-- 5. 交互与行为 (Interaction & Behavior)
-- ====================================================================
opt.mouse = "a"                 -- 允许鼠标支持
opt.clipboard = "unnamedplus"   -- 与系统剪贴板同步
opt.virtualedit = "block"       -- 允许 Visual Block 模式下光标移向空白区
opt.timeoutlen = 500            -- 映射等待时间 (影响 Which-key 弹出速度)
opt.updatetime = 300            -- 响应速度 (影响 GitSigns 等更新)
opt.splitbelow = true           -- 新水平拆分窗口在下方
opt.splitright = true           -- 新垂直拆分窗口在右方
opt.whichwrap = "<,>,[,]"       -- 指定键在行首尾时可以跨行跳转
opt.wildmenu = true             -- 增强模式命令行补全提示

-- ====================================================================
-- 6. 自动补全选项 (Completion)
-- ====================================================================
-- menu: 显示菜单; menuone: 只有一个选项也显示; noselect: 不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
