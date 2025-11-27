return {
    'neovim/nvim-lspconfig', 
    
    dependencies = {
        'hrsh7th/nvim-cmp', 
        'folke/neodev.nvim',
    },
    
    config = function()
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local map = vim.keymap.set
        
        -- 核心 LSP 映射函数
        local on_attach = function(client, bufnr)
            -- LSP 功能
            map('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'LSP: Definition' })
            map('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'LSP: Declaration' })
            map('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'LSP: References' })
            map('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'LSP: Hover Doc' })
            map('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'LSP: Rename' })
            map('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'LSP: Code Action' })
            map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { buffer = bufnr, desc = 'LSP: Format' })
            
            -- 诊断 (Diagnostic) 查看
            map('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'LSP: Prev Diagnostic' })
            map('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr, desc = 'LSP: Next Diagnostic' })
            map('n', 'gl', vim.diagnostic.open_float, { buffer = bufnr, desc = 'LSP: Show Line Diagnostic' })
            map('n', '<leader>dl', vim.diagnostic.setloclist, { buffer = bufnr, desc = 'LSP: Diagnostics List' })
            
            vim.notify('LSP server started: ' .. client.name, vim.log.levels.INFO)
        end
        
        -- LSP 共享配置
        local capabilities = cmp_nvim_lsp.default_capabilities()
        require('neodev').setup()

        -- Gopls 配置
        vim.lsp.config('gopls', {
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "gopls" },
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                        shadow = true,
                    },
                    staticcheck = true,
                    gofumpt = true,
                },
            },
        })
        
        -- 启用 Gopls
        vim.lsp.enable('gopls')
    end
}
