local treesitter = require("nvim-treesitter")
local treesitter_source = debug.getinfo(treesitter.setup, "S").source:sub(2)
local treesitter_runtime = vim.fn.fnamemodify(treesitter_source, ":h:h:h") .. "/runtime"
vim.opt.rtp:prepend(treesitter_runtime)

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
