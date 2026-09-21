local treesitter = require("nvim-treesitter")

treesitter.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

treesitter.install({
  "lua",
  "python",
  "bash",
  "javascript",
  "html",
  "css",
  "markdown",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python", "sh", "javascript", "html", "css", "markdown" },
  callback = function(args)
    vim.treesitter.start(args.buf)
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
  end,
})

vim.opt.foldenable = false
