require("yongineer.telescope")
require("yongineer.git-worktree")
require("yongineer.harpoon")
require("yongineer.lsp")
require("yongineer.statusline")
require("yongineer.surround")
require("yongineer.flutter-tool")
require("yongineer.dap")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

