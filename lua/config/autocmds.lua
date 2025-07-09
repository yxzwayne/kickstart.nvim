-- Autocommands configuration

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set language-specific indentation following industry standards
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Set 2-space indentation for web/config languages',
  group = vim.api.nvim_create_augroup('indent-2-spaces', { clear = true }),
  pattern = { 
    'lua', 'javascript', 'typescript', 'json', 'yaml', 'yml', 'html', 'css', 'scss', 
    'vue', 'svelte', 'jsx', 'tsx', 'xml', 'markdown', 'toml', 'dockerfile'
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Set 4-space indentation for system languages',
  group = vim.api.nvim_create_augroup('indent-4-spaces', { clear = true }),
  pattern = { 
    'python', 'java', 'c', 'cpp', 'cs', 'php', 'ruby', 'go', 'rust', 'kotlin', 'scala'
  },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})