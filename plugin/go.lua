require("go").setup()

-- Run gofmt + goimport on save

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
    -- lspconfig 内でフォーマットするためここはコメントアウト
    --require("go.format").gofmt()
    --require("go.format").goimport()
	end,
	group = format_sync_grp,
})
