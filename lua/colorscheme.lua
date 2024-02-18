vim.cmd([[
try
  colorscheme catppuccin-frappe
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
