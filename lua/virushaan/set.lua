vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "200"

vim.g.prettierautoformat = 1
vim.g.prettierautoformat_require_pragma = 0

local cmd = vim.cmd

cmd [[
  augroup YankHighlight 
  autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end

  autocmd BufNewFile * :write

  autocmd BufWrite * :PrettierAsync
]]
