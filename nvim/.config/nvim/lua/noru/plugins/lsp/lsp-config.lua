return {
   {
      "neovim/nvim-lspconfig",
      config = function()
         local lspconfig = require("lspconfig")
         -- Log level off to save storage
         -- vim.lsp.set_log_level("off")
         -- For Lua Language

         lspconfig.lua_ls.setup({
            settings = {
               Lua = {
                  runtime = {
                     -- Tell the language server which version of Lua you're using
                     -- (most likely LuaJIT in the case of Neovim)
                     version = "LuaJIT",
                  },
                  diagnostics = {
                     disable = { "missing-fields" },
                     -- Get the language server to recognize the `vim` global
                     globals = {
                        "vim",
                        "require",
                     },
                  },
                  workspace = {
                     -- Make the server aware of Neovim runtime files
                     library = vim.api.nvim_get_runtime_file("", true),
                  },
                  -- Do not send telemetry data containing a randomized but unique identifier
                  telemetry = {
                     enable = false,
                  },
               },
            },
         })
         vim.diagnostic.config({
            virtual_text = false,
         })
         vim.keymap.set("n", "<Leader>d", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>")
         vim.lsp.config("lua_ls", {
            cmd = { "lua-language-server" },
            root_markers = { "lua" },
            filetypes = {
               ".luarc.json",
               ".luarc.jsonc",
               ".luacheckrc",
               ".stylua.toml",
               "stylua.toml",
               "selene.toml",
               "selene.yml",
               ".git",
            },
         })

         -- For C Language
         vim.lsp.config("clangd", {
            cmd = { "clangd" },
            root_markers = {
               ".clangd",
               ".clang-tidy",
               ".clang-format",
               "compile_commands.json",
               "compile_flags.txt",
               "configure.ac",
               ".git",
            },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
         })
         vim.lsp.enable("clangd")

         -- Keybinds
         vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
         vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
         -- No need now with the addition of another plugin
         -- vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
         vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
         vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
         vim.keymap.set("n", "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
         vim.keymap.set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>")
         vim.keymap.set("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>")
         vim.keymap.set("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>")
         vim.keymap.set("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
         vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
         vim.keymap.set("n", "cd", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
         vim.keymap.set("n", "cd", "<cmd>lua vim.diagnostic.goto_next()<cr>")
         vim.keymap.set("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>")
         vim.keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<cr>")
         vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
         vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

         -- Switch source header
         vim.keymap.set("n", "<leader>sh", function()
            local file = vim.fn.expand("%:p") -- full path
            if file:match("%.cpp$") then
               local header = file:gsub("%.cpp$", ".hpp")
               vim.cmd("edit " .. header)
            elseif file:match("%.hpp$") then
               local source = file:gsub("%.hpp$", ".cpp")
               vim.cmd("edit " .. source)
            else
               print("Not a .cpp or .hpp file")
            end
         end, { desc = "Toggle between .cpp and .hpp" })

         -- Do stuff on attach
         -- vim.api.nvim_create_autocmd('LspAttach', {
         --     group = vim.api.nvim_create_augroup('my.lsp', {}),
         --     callback = function(args)
         --         local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
         --         if client:supports_method('textDocument/implementation') then
         --             -- Create a keymap for vim.lsp.buf.implementation ...
         --         end
         --         -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
         --         -- if client:supports_method('textDocument/completion') then
         --         -- Optional: trigger autocompletion on EVERY keypress. May be slow!
         --         -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
         --         -- client.server_capabilities.completionProvider.triggerCharacters = chars
         --         -- vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
         --         -- end
         --         -- Auto-format ("lint") on save.
         --         -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
         --         if not client:supports_method('textDocument/willSaveWaitUntil')
         --             and client:supports_method('textDocument/formatting') then
         --             vim.api.nvim_create_autocmd('BufWritePre', {
         --                 group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
         --                 buffer = args.buf,
         --                 callback = function()
         --                     vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
         --                 end,
         --             })
         --         end
         --     end,
         -- })
      end,
   },
}
