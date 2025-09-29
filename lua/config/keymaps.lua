-- Centralized keymaps configuration

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Buffer navigation keymaps (using <leader>b prefix)
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = '[B]uffer [N]ext', noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = '[B]uffer [P]revious', noremap = true, silent = true })
vim.keymap.set('n', '<leader>bl', ':buffers<CR>', { desc = '[B]uffer [L]ist', noremap = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = '[B]uffer [D]elete', noremap = true })
vim.keymap.set('n', '<leader>bw', ':bwipe<CR>', { desc = '[B]uffer [W]ipe', noremap = true })

-- Folding keymaps
vim.keymap.set('n', 'za', 'za', { desc = 'Toggle fold under cursor' })
vim.keymap.set('n', 'zA', 'zA', { desc = 'Toggle all folds under cursor recursively' })
vim.keymap.set('n', 'zc', 'zc', { desc = 'Close fold under cursor' })
vim.keymap.set('n', 'zo', 'zo', { desc = 'Open fold under cursor' })
vim.keymap.set('n', 'zC', 'zC', { desc = 'Close all folds under cursor recursively' })
vim.keymap.set('n', 'zO', 'zO', { desc = 'Open all folds under cursor recursively' })
vim.keymap.set('n', 'zr', 'zr', { desc = 'Reduce folding by opening one more level' })
vim.keymap.set('n', 'zR', 'zR', { desc = 'Open all folds' })
vim.keymap.set('n', 'zm', 'zm', { desc = 'Increase folding by closing one more level' })
vim.keymap.set('n', 'zM', 'zM', { desc = 'Close all folds' })

-- Copy absolute file path to clipboard
vim.keymap.set('n', '<A-S-C>', function() 
  vim.fn.setreg('+', vim.fn.expand('%:p')) 
end, { desc = 'Copy absolute file path to clipboard' })

-- Ensure Telescope keybindings are loaded early
-- These are duplicated from plugins/editor.lua to ensure they're available immediately
vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').find_files() end, { desc = 'Find files (Telescope)' })
vim.keymap.set('n', '<C-f>', function() require('telescope.builtin').live_grep() end, { desc = 'Search by Grep (Telescope)' })

-- Universal go-to-definition that works with or without LSP
vim.keymap.set('n', 'gd', function()
  -- Try LSP first
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    vim.lsp.buf.definition()
  else
    -- Fallback to built-in tag jumping
    vim.cmd('normal! gd')
  end
end, { desc = 'Go to definition (LSP or built-in)' })

-- Delete without copying keymaps
vim.keymap.set('n', '<leader>dd', 'dd', { noremap = true, desc = 'Delete line (original dd behavior)' })
vim.keymap.set('n', 'dd', '"_dd', { noremap = true, desc = 'Delete line without copying' })