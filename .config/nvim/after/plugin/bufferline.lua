require('bufferline').setup {
  options = {
    numbers = "ordinal",
    max_name_length = 20,
    max_prefix_length = 15,
    tab_size = 20,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = false,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  }
}

