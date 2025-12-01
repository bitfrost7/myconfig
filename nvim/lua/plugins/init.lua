-- lua/plugins/init.lua (必须确保加载了所有模块和核心依赖)

return {
    { 'folke/tokyonight.nvim', lazy = false, priority = 1000 },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'nvim-lua/plenary.nvim' },

    require("plugins.lualine"),
    require("plugins.bufferline"),
    require("plugins.nvim-tree"),
    require("plugins.gitsigns"), 
    
    require("plugins.lsp"), 
    require("plugins.cmp"),
}
