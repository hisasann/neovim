local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.prettier.with {
      prefer_local = "node_modules/.bin",
    },
    formatting.stylua,
  },
})
