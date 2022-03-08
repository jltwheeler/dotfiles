local nvim_lsp = require('lspconfig')
local null_ls = require('null-ls')

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local generic_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', '<cmd>LspDef<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>LspRename<CR>', opts)
  buf_set_keymap('n', 'gy', '<cmd>LspTypeDef<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>LspHover<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>LspDiagPrev<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>LspDiagNext<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>LspImplementation<CR>', opts)
  buf_set_keymap('n', 'ga', '<cmd>LspCodeAction<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>LspSignatureHelp<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>LspFormatting<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

-- IMPORTANT: use npm for installing language servers. Copy the command below:
-- npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d pyright @prisma/language-server

-- Python
nvim_lsp['pyright'].setup {}

-- Rust language server
require('rust-tools').setup({
  tools = {
    hover_with_actions = false,
    runnables = {
      use_telescope = false
    },
    debuggables = {
      use_telescope = false
    },
    inlay_hints = {
      -- prefix for parameter hints
      parameter_hints_prefix = ": ",

      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = ": ",
    }
  },
  server = {
      -- on_attach is a callback called when the language server attachs to the buffer
      on_attach = generic_attach,
      settings = {
          -- to enable rust-analyzer settings visit:
          -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
          ["rust-analyzer"] = {
              -- enable clippy on save
              checkOnSave = {
                  command = "clippy"
              },
          }
      }
  },
})

-- TypeScript language server
nvim_lsp.tsserver.setup {
    on_attach = function(client, bufnr)

        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false        

        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({
            debug = false,
            disable_commands = false,
            enable_import_on_completion = true,

            import_all_timeout = 5000,
            import_all_priorities = {
                buffers = 4,
                buffer_content = 3,
                local_files = 2,
                same_file = 1,
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,

            -- update imports on file move
            update_imports_on_move = true,
            require_confirmation_on_move = false,
            watch_dir = nil,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},
        })
        ts_utils.setup_client(client)

        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")

        generic_attach(client, bufnr)
    end
}

nvim_lsp["prismals"].setup({
  on_attach = generic_attach,
  settings = {
    prisma = {
      prismaFmtBinPath = "/Users/jwheeler/.nvm/versions/node/v14.17.3/bin/"
    }
  },
})

nvim_lsp["terraformls"].setup({
  on_attach = function (client, buffer) 
      generic_attach(client, bufnr)
      client.resolved_capabilities.document_formatting = false
  end,
})

--[[ nvim_lsp["eslint"].setup({
    root_dir = nvim_lsp.util.root_pattern(".eslintrc", ".eslintrc.js"),
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = true
        generic_attach(client, bufnr)
    end,
    settings = {
        format = {
            enable = true,
        },
    },
}) ]]

-- Enable null-ls integration for eslint integration
null_ls.setup({
  save_after_format = false,
  sources = {
    -- eslint_d/js/jsx/ts/tsx handled by nvim_ts_utils
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "yaml", "json", "html", "css", "scss" },
      disabled_filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    }),
    null_ls.builtins.formatting.terraform_fmt,
  },
  on_attach = generic_attach,
  flags = {
    debounce_text_changes = 250,
  },
})

