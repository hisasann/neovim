-- nvim-lint設定（linter）
local status, lint = pcall(require, "lint")
if not status then
	return
end

lint.linters_by_ft = {
	javascript = { "eslint" },
	typescript = { "eslint" },
	lua = { "luacheck" },
	go = { "golangcilint" },
}

-- 自動リント
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})
