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

vim.g.syntastic_auto_jump = 0

vim.g.prettierautoformat = 1
vim.g.prettierautoformat_require_pragma = 0

local cmd = vim.cmd
local is_mac = vim.fn.has "macunix" == 1
local home_dir = "/home/virushaan"
if is_mac then
  home_dir = "/Users/virushaan"
end
-- pin nvim to a specific node version, regardless of the project
-- prereq - need to install: nvm i 16.17.1
local node_bin =  "/.nvm/versions/node/v18.12.0/bin"
vim.g.node_host_prog = home_dir .. node_bin .. "/node"

-- for mason.nvim
-- prereq - install lsp server in that node/bin npm i -g typescript-language-server 
-- (handled by :Mason currently)
vim.cmd("let $PATH = '" .. home_dir .. node_bin .. ":' . $PATH")

cmd [[
  augroup YankHighlight 
  autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end

  autocmd BufNewFile * :write

  autocmd BufWritePre * lua vim.lsp.buf.format()
  ]]
  
--  autocmd BufWritePre *.ts,*.tsx :term yarn lint-staged

--  autocmd BufWrite *.js,*.jsx,*.ts,*.tsx :PrettierAsync
--  autocmd BufWrite *rs :%! rustfmt
--  autocmd BufWrite *.go :%! gofmt -s
