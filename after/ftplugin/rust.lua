vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4
vim.opt_local.smartindent = true
vim.opt_local.cindent = false
vim.opt_local.expandtab = true
vim.b.minihipatterns_config = {
    highlighters = {
        rust_todo = { pattern = 'todo!', group = 'MiniHipatternsTodo' },
    },
}
