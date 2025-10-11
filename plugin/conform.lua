-- conform.nvim設定（formatter）
local status, conform = pcall(require, "conform")
if not status then
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		go = { "goimports" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
