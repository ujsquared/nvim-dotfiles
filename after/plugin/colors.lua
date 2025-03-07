require('vague').setup({
    disable_background=True,
    transparent_background=True
})
function ColorMyPencils(color)
	color = color or "vague"
	vim.cmd.colorscheme(color)


	vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

ColorMyPencils()
