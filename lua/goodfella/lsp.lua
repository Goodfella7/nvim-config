-- lsp servers
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('bashls')
vim.lsp.enable('clangd')

 
vim.diagnostic.config({
  virtual_text = true,        -- Show errors inline
  signs = true,               -- Show signs in gutter
  update_in_insert = false,   -- Don't update while typing
  underline = true,           -- Underline errors
  severity_sort = true,       -- Sort errors by severity
})

-- Better hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded",
    focusable = false,
  }
)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Quickfix list' })


