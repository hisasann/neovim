vim.cmd([[
try
  colorscheme solarized-osaka
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
