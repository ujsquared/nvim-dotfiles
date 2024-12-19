local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }

    -- Key mappings for LSP functions
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)  -- Go to definition
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)        -- Hover documentation
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)  -- Go to implementation
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)  -- Find references
end
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {'clangd','lua_ls','cssls','html','ts_ls'}
})
-- require("lspconfig").pylsp.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,}
require("lspconfig").lua_ls.setup{}
require("lspconfig").clangd.setup{}
require("lspconfig").cssls.setup{}
require("lspconfig").gopls.setup{}
require("lspconfig").html.setup{}
require("lspconfig").tailwindcss.setup{}
require("lspconfig").pyright.setup{
    on_attach = on_attach,
    flake8 = {enabled = true},
}
require('lspconfig').ts_ls.setup{
    on_attach = function (client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")
    end,
    settings = {
        typescript = {
            completions = {
                completeFunctionCalls = true,
            }
        },
        javascript = {
            completions = {
                completeFunctionCalls = true
            }
        }
    }
}
-- require('sonarlint').setup({
--    server = {
--       cmd = {
--          'sonarlint-language-server',
--          -- Ensure that sonarlint-language-server uses stdio channel
--          '-stdio',
--          '-analyzers',
--          -- paths to the analyzers you need, using those for python and java in this example
--          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
--          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
--          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
--       },
--       -- All settings are optional
--       settings = {
--          -- The default for sonarlint is {}, this is just an example
--          sonarlint = {
--             rules = {
--                ['typescript:S101'] = { level = 'on', parameters = { format = '^[A-Z][a-zA-Z0-9]*$' } },
--                ['typescript:S103'] = { level = 'on', parameters = { maximumLineLength = 180 } },
--                ['typescript:S106'] = { level = 'on' },
--                ['typescript:S107'] = { level = 'on', parameters = { maximumFunctionParameters = 7 } }
--             }
--          }
--       }
--    },
--    filetypes = {
--       -- Tested and working
--       'python',
--       'cpp',
--       -- Requires nvim-jdtls, otherwise an error message will be printed
--       'java',
--    }
-- })
