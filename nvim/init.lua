-- ====================================================================
--                      主入口文件: init.lua
-- ====================================================================

-- 设置 Leader 键
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 加载基本配置
require("config.options")
require("config.keymaps")
require("config.settings")

-- 插件管理器：检查并安装 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 启动 lazy.nvim 并加载插件配置
require("lazy").setup({
  spec = {
    { import = "editor" }, -- 编辑器
    { import = "tools" },  -- 工具
    { import = "ui" },     -- 外观样式
  },
  install = { colorscheme = { "tokyonight-storm" } }
})
