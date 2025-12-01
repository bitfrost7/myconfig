return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- 确保安装了解析器

    config = function()
        require('nvim-treesitter.configs').setup({
            -- 默认开启高亮
            highlight = {
                enable = true,
                disable = { 'go' }, 
            },
            -- 智能缩进
            indent = { enable = true },
            
            -- 核心语言列表 (Hugo 常用)
            ensure_installed = {
                'markdown', 
                'markdown_inline', -- Markdown 内部元素，如链接、强调
                'go', 
                'html', 
                'yaml', 
                'toml', -- Hugo 配置
                'lua', -- Neovim 配置
            },

            -- 针对 Markdown 的增强，用于实现更精确的文本对象
            textobjects = {
                select = {
                    enable = true,
                    lookbehind = true, -- 允许向后查找
                    keymaps = {
                        -- 选中整个 markdown 块 (例如：代码块、列表项)
                        ['iM'] = { query = '@block.outer', desc = 'Inner Markdown Block' },
                        ['aM'] = { query = '@block.outer', desc = 'Around Markdown Block' },
                    },
                },
            },
        })

        -- 启用折叠
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
        -- 默认展开
        vim.opt.foldlevel = 99
    end
}
