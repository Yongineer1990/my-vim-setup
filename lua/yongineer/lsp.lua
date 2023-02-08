-- local util = require'/Users/yong_macbook/.vim/plugged/nvim-lspconfig/lua/lspconfig/util'
local sumneko_root_path = '/usr/local/bin'
local sumneko_binary = sumneko_root_path .. "/lua-language-server"

local function on_attach()
    -- TODO: TJ told me to do this and I should do it because he is Telescopic
    -- "Big Tech" "Cash Money" Johnson
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.tsserver.setup{ on_attach=on_attach }
require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

-- pyls
-- require'lspconfig'.pyls.setup{
--     on_attach=on_attach,
--     settings = {
--         pyls = {
--             plugins = {
--                 preload = {
--                     modules = { "django", "flask", "fastapi", "djangorestframework" }
--                 },
--                 pycodestyle = {
--                     ignore = { "E203", "E126", "E131", "E251" },
--                     maxLineLength = 100,
--                 },
--             },
--         },
--     },
-- }


-- pylsp
require'lspconfig'.pylsp.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
    cmd = { "pyls" },
    filetypes = { "python" },
    -- root_dir = function(fname)
    --     local root_files = {
    --         'pyproject.toml',
    --         'setup.py',
    --         'setup.cfg',
    --         'requirements.txt',
    --         'Pipfile',
    --     }
    --     return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    -- end,
    settings = {
        pyls = {
            plugins = {
                preload = {
                    modules = { "django", "flask", "fastapi", "djangorestframework" }
                },
                pycodestyle = {
                    ignore = { "E203", "E126", "E131", "E251" },
                    maxLineLength = 100,
                },
            },
        },
    },
}

-- java_language_server
-- require'lspconfig'.java_language_server.setup{
--     on_attach = on_attach,
--     cmd = { "bash", "~/.config/nvim/java-language-server/scripts/link_mac.sh" },
--     filetype = { "java" },
--     root_dir = function() return vim.loop.cwd() end,
--     settings = {},
-- }

-- jdtls
-- require'lspconfig'.jdtls.setup{
--     on_attach=on_attach,
--     cmd_env = {
--         JAR="~/Projects/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.200.v20210416-2027.jar",
--     },
--     root_dir = vim.loop.cwd
-- }

require'lspconfig'.gopls.setup{ on_attach=on_attach }
-- who even uses this?
require'lspconfig'.rust_analyzer.setup{ on_attach=on_attach }

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

-- html
require'lspconfig'.html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "htmldjango", "eruby" }
}

-- ruby
require'lspconfig'.solargraph.setup {
    on_attach = on_attach,
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    init_options = {
        formatting = true
    },
    settings = {
        solargraph = {
            diagnostics = true
        }
    }
}
-- require'lspconfig'.sorbet.setup{
--     cmd = { "srb", "tc", "--lsp", "--" },
--     filtypes = { "ruby" },
-- }

-- dart
-- require'lspconfig'.dartls.setup {
--     on_attach = on_attach,
--     cmd = { "dart", "/Users/yong_macbook/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },
--     filtypes = { "dart" },
--     init_options = {
--         closingLabels = true,
--         flutterOutline = true,
--         onlyAnalyzeProjectsWithOpenFiles = true,
--         outline = true,
--         suggestFromUnimportedLibraries = true
--     },
--     settings = {
--         dart = {
--             completeFunctionCalls = true,
--             showTodos = true
--         }
--     }
-- }

local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

require('symbols-outline').setup(opts)
