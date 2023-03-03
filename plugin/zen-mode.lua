local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

zenMode.setup {
}

-- :ZenMode でやるからコメントアウト
--vim.keymap.set('n', '<C-n>o', '<Cmd>ZenMode<CR>', { silent = true })
