-- 通用按键映射
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = 'Clear search highlight' })
-- 双击切换模式
vim.keymap.set("n", "<Leader><Leader>", "i", { noremap = true, silent = true })
vim.keymap.set("i", "<Leader><Leader>", "<Esc>", { noremap = true, silent = true })
