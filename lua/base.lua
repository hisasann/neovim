vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"

vim.wo.number = true

-- Open hoge file
vim.api.nvim_create_user_command("Hoge", function(opts)
	vim.cmd("e " .. "~/_/hoge/hoge.markdown")
end, {})

-- for notion dialy
-- remove return
vim.api.nvim_create_user_command("M", function(opts)
	vim.cmd(":%s/\\%(.\\)\\@<!\\n//ig")
end, {})

-- remove markdown link
vim.api.nvim_create_user_command("L", function(opts)
	vim.cmd(":%s/\\!\\[.*\\]\\(.*\\)\\n//ig")
end, {})

--require("run-storm").setup("/Users/hisasann/_/dotfile/")

function run_storm(directory, on_confirm)
	local function get_buffer()
		if cache_bufnr ~= nil and vim.fn.bufexists(cache_bufnr) then
			return cache_bufnr
		end
		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_name(buf, "vim-ui-input")
		vim.api.nvim_buf_set_option(buf, "filetype", "vim-ui-input")
		cache_bufnr = buf
		return buf
	end

	local function open_window(buffer, title)
		if title ~= nil and type(title) == "string" then
			title = { { title, "InputFloatTitle" } }
		end
		local win = vim.api.nvim_open_win(buffer, true, {
			relative = "cursor",
			row = 1,
			col = 1,
			width = 40,
			height = 1,
			focusable = true,
			border = "rounded",
			title = title,
			title_pos = "left",
			noautocmd = true,
		})
		vim.api.nvim_win_set_option(win, "number", false)
		vim.api.nvim_win_set_option(win, "relativenumber", false)
		vim.api.nvim_win_set_option(win, "wrap", false)
		vim.api.nvim_win_set_option(win, "cursorline", false)
		vim.api.nvim_win_set_option(win, "winhighlight", "FloatBorder:InputFloatBorder,NormalFloat:Normal")
		--vim.fn.sign_place(1, "", "InputPrompt", buffer, { lnum = vim.fn.line(".") })
		return win
	end

	local buffer = get_buffer()
	local prompt = "JetBrains IDE Command:"

	local on_confirm = vim.F.if_nil(on_confirm, function(shell_file_name)
		local row = unpack(vim.api.nvim_win_get_cursor(0))
		print(directory)
		local cmd = ":silent exec '!command sh"
			.. " "
			.. directory
			.. shell_file_name
			.. ".sh --line "
			.. row
			.. " "
			.. vim.fn.expand("%:p")
			.. "'"
		vim.cmd(cmd)
		print(shell_file_name)
	end)

	local window = open_window(buffer, prompt)

	vim.cmd("startinsert!")

	vim.keymap.set("i", "<ESC>", function()
		vim.cmd("stopinsert")
		vim.api.nvim_win_close(window, false)
	end, { buffer = buffer })

	vim.keymap.set("i", "<CR>", function()
		vim.cmd("stopinsert")
		local input = vim.fn.getline(".")
		print(input)
		vim.api.nvim_win_close(window, false)
		on_confirm(input)
	end, { buffer = buffer })
end

local function setup(directory)
	vim.api.nvim_create_user_command("St", function()
		run_storm(directory)
	end, {})
end

setup("/Users/hisasann/_/dotfile/")
