require("mason").setup()
require("mason-null-ls").setup({
    automatic_installation = true,
    ensure_installed = { "black", "flake8" },
})
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black,
    },
})
