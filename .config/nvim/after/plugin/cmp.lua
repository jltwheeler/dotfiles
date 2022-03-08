local cmp = require('cmp')

cmp.setup {
  snippet = {
    expand = function(args)
      -- You must install `vim-vsnip` if you use the following as-is.
      vim.fn['vsnip#anonymous'](args.body)
    end
  },

  -- You can set mapping if you want.
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
    }),
    ['<Tab>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'vsnip' },
  },

  formatting = {
    format = function(entry, vim_item)
      -- this is for fancy icons in the completion menu
      vim_item.kind = require('lspkind').presets.default[vim_item.kind] .. " " .. vim_item.kind

      -- adds name of kind for each source
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        path = "[Path]",
        calc = "[Calc]",
        vsnip = "[VSnip]",
      })[entry.source.name]
      return vim_item
    end
  }
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline('?', {
  sources = {
    { name = 'buffer' }
  }
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())
