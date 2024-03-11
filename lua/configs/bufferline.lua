vim.opt.termguicolors = true

local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

bufferline.setup({
  options = {
    style_preset = {
      bufferline.style_preset.no_italic,
    },
    indicator = {
      icon = "|",
      style = "underline",
    },
    max_name_length = 18,
    -- 使用 nvim 内置lsp
    diagnostics = "nvim_lsp",
    -- 左侧让出 nvim-tree 的位置
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        -- highlight = "Directory",
        text_align = "left",
        separator = true,
      },
    },
    color_icon = true,
    show_buffer_icons = true,
    show_close_icons = true,
    separator_style = "slant",
    hover = {
      enable = true,
      delay = 200,
      reveal = { "close" },
    },
    numbers = "ordinal",
    close_command = "bdelete! %d",
    tab_size = 18,
  },
})
