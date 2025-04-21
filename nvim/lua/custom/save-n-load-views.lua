-- remember_folds : https://github.com/kevinhwang91/nvim-ufo/issues/115
vim.cmd [[
  set viewoptions-=curdir

  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]]
