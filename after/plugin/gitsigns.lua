return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup()
    
    -- Optional keymaps
    vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {noremap=true, desc = "Gitsigns: preview hunk"})
    vim.keymap.set("n", "<leader>gi", ":Gitsigns preview_hunk_inline<CR>", {noremap=true, desc = "Gitsigns: preview hunk inline"})
  end
}
