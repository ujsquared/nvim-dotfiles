local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Define on_attach function
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- Add more keymaps as needed
end

-- Define capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
