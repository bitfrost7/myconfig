local map = vim.keymap
-- 通用按键映射
map.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
map.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
map.set('n', '<leader>h', ':nohlsearch<CR>', { desc = 'Clear search highlight' })

-- buffer相关按键
map.set("n", "<leader>i", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map.set("n", "<leader>o", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
-- [LD+i] [lLD+o] 上个/下个标签                                                 
map.set('n', '<leader>i', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next Buffer' }) 
map.set('n', '<leader>o', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Prev Buffer' }) 
-- [LD+bc] 关闭标签                                                             
                                                                                
map.set('n', '<leader>bc', '<Cmd>bd<CR>', { desc = 'Buffer: Close current buffer' })
-- [LD 1-9 选择1-9标签]                                                         
for i = 1, 9 do                                                                 
    map.set('n', vim.g.mapleader .. i, '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>') 
end                                                                             
