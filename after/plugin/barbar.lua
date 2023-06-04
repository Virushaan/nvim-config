-- vim.g.barbar_auto_setup = true -- disable auto-setup
require'barbar'.setup {
      -- Set the filetypes which barbar will offset itself for
    sidebar_filetypes = {
      -- Use the default values: {event = 'BufWinLeave', text = nil}
      NERDTree = true
    },
}
