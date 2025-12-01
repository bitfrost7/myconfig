-- lua/plugins/cmp.lua

return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- 补全源：从 LSP 获取建议 (Gopls)
        'hrsh7th/cmp-nvim-lsp',
        -- 补全源：从当前缓冲区文本获取建议
        'hrsh7th/cmp-buffer',
        -- 补全源：文件路径补全
        'hrsh7th/cmp-path',
        -- snippet 引擎（推荐搭配 cmp 使用）
        'L3MON4D3/LuaSnip', 
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        -- 设置 nvim-cmp
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            
            -- 补全窗口外观设置
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            
            -- 核心：定义补全源的顺序
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },     -- 【LSP 补全】 从 Gopls 获取
                { name = 'buffer' },       -- 文本补全
                { name = 'path' },         -- 路径补全
            }),
            
            -- 核心：补全快捷键映射
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                
                -- 核心确认键：<CR> 或 <Tab>
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- 确认并接受建议
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item() -- 在补全列表中切换下一个
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump() -- 展开或跳转到下一个 snippet
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            
            -- 启用 nvim-cmp 自动补全
            enabled = function()
                return not (vim.api.nvim_get_mode().mode == 'c')
            end,
            
        })
    end
}
