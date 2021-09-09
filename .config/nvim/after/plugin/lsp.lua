local nvim_lsp = require('lspconfig')

-- IMPORTANT: use npm for installing language servers. Copy the command below:
-- npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d pyright

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
  }
})

-- Enable null-ls integration for eslint integration
require("null-ls").config {}
nvim_lsp["null-ls"].setup {}

-- TypeScript language server
nvim_lsp.tsserver.setup {
    on_attach = function(client, bufnr)
        -- disable tsserver formatting if you plan on formatting via null-ls
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")

        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = true,

            import_all_timeout = 5000, -- ms
            import_all_priorities = {
                buffers = 4, -- loaded buffer names
                buffer_content = 3, -- loaded buffer content
                local_files = 2, -- git files or files with relative path markers
                same_file = 1, -- add to existing import statement
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,

            -- eslint
            eslint_enable_code_actions = true,
            eslint_enable_disable_comments = true,
            eslint_bin = "eslint_d",
            eslint_enable_diagnostics = false,
            eslint_opts = {},

            -- formatting
            enable_formatting = true,
            formatter = "prettier",
            formatter_opts = {},

            -- update imports on file move
            update_imports_on_move = true,
            require_confirmation_on_move = false,
            watch_dir = nil,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},
        }

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)

        -- no default maps, so you may want to define some here
        local opts = { silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)

        -- disable tsserver formatting
        client.resolved_capabilities.document_formatting = false

        -- define an alias
        vim.cmd("command -buffer Formatting lua vim.lsp.buf.formatting()")
        vim.cmd("command -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")

        -- format on save
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
}

