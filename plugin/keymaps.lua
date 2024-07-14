local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>A', require('utils.ast-grep').execute, opts) -- ast-grep
keymap.set('i', '<C-c>', '<Esc>', opts) -- everybody has a cursed mapping
keymap.set('n', 'x', '"_x')

-- avoid walking with space
keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end, opts)

-- increment/decrement
keymap.set({ 'n', 'v' }, '+', '<C-a>')
keymap.set({ 'n', 'v' }, '-', '<C-x>')
keymap.set('v', 'g+', 'g<C-a>', opts)
keymap.set('v', 'g-', 'g<C-x>', opts)

-- move lines
keymap.set('v', 'J', ":m '>+1<Return>gv=gv", opts)
keymap.set('v', 'K', ":m '<-2<Return>gv=gv", opts)
keymap.set('n', '<leader>j', ':m .+1<Return>==', opts)
keymap.set('n', '<leader>k', ':m .-2<Return>==', opts)

keymap.set('n', 'g;', '`[', opts) -- go back to last edited line
keymap.set('n', '<Leader>o', 'o<Esc>^Da', opts)
keymap.set('n', '<Leader>O', 'O<Esc>^Da', opts)

keymap.set('n', '<leader>t', ':tabnew<Return>', opts)
keymap.set('n', '>', ':tabnext<Return>', opts)
keymap.set('n', '<', ':tabprev<Return>', opts)

-- split window
keymap.set('n', '<leader>]', ':split<Return>', opts)
keymap.set('n', '<leader>[', ':vsplit<Return>', opts)
keymap.set('n', '<leader>-', '<C-w>_<C-w><Bar>', opts) -- maximize window
keymap.set('n', '<leader>=', '<C-w>=', opts) -- equalize windows

-- indent lines
keymap.set('v', '<', '<gv', opts)
keymap.set('v', '>', '>gv', opts)
keymap.set('n', '<A-z>', ':set wrap!<Return>', opts) -- wrap lines

keymap.set('n', '<leader>Y', 'ggVG"+y', opts) -- copy all
keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], opts) -- copy to clipboard
keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], opts) -- delete but don't yank
keymap.set('x', '<leader>p', [["_dP]], opts) -- paste but don't yank the deleted text

-- replace occurrences
keymap.set(
  'n',
  '<leader>r',
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  opts
)

-- make file executable
keymap.set('n', '<leader>x', ':!chmod +x %<Return>', opts)

-- datsvault (https://gist.github.com/datsfilipe/15a407d5bfbd21778787ccd02a8a2020)
keymap.set('n', '<leader>l', ':silent !tmux neww datsvault -l<Return>', opts)

-- toggle inlay hints
keymap.set('n', '<leader>hh', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 })
end, opts)

-- tmux-sessionizer (https://github.com/datsfilipe/unix-scripts/blob/main/tmux-sessionizer)
-- keymap.set('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<Return>', opts)

-- zellij-sessionizer (https://github.com/datsfilipe/unix-scripts/blob/main/zellij-sessionizer)
keymap.set('n', '<C-f>', function()
  io.popen('zellij-sessionizer'):close()
end, opts)

-- zellij-session-nav (https://github.com/datsfilipe/unix-scripts/blob/main/zellij-session-nav)
keymap.set('n', '<A-0>', function()
  io.popen('zellij-session-nav --headless 0'):close()
end, opts)
keymap.set('n', '<A-1>', function()
  io.popen('zellij-session-nav --headless 1'):close()
end, opts)
keymap.set('n', '<A-2>', function()
  io.popen('zellij-session-nav --headless 2'):close()
end, opts)
keymap.set('n', '<A-3>', function()
  io.popen('zellij-session-nav --headless 3'):close()
end, opts)
keymap.set('n', '<A-4>', function()
  io.popen('zellij-session-nav --headless 4'):close()
end, opts)
keymap.set('n', '<A-5>', function()
  io.popen('zellij-session-nav --headless 5'):close()
end, opts)
keymap.set('n', '<A-6>', function()
  io.popen('zellij-session-nav --headless 6'):close()
end, opts)
keymap.set('n', '<A-7>', function()
  io.popen('zellij-session-nav --headless 7'):close()
end, opts)
keymap.set('n', '<A-8>', function()
  io.popen('zellij-session-nav --headless 8'):close()
end, opts)
keymap.set('n', '<A-9>', function()
  io.popen('zellij-session-nav --headless 9'):close()
end, opts)
