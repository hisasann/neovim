-- 非推奨警告を無効化
vim.deprecate = function(name, alternative, version, plugin, backtrace)
	-- 非推奨警告を無視
end

require("base")
require("autocmds")
require("options")
require("keymaps")
require("colorscheme")
require("plugins")
