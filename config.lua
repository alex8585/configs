-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
}
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "php",
  },
})

-- require("conform").setup({
--   formatters_by_ft = {
--     blade = { "blade-formatter" }
--   },
-- })
vim.g.vimsyn_embed = 'l'
require("nvim-treesitter.configs").setup {
  ensure_installed = { "php", "html", "css", "javascript" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}


vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'H', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'L', ':bprevious<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<C-a>", ":resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-b>", ":resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-c>", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", ":vertical resize +5<CR>", { noremap = true, silent = true })

-- vim.keymap.set("n", "<C-l>", function()
--   vim.lsp.buf.format({ async = false })
-- end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-s>", function()
  vim.lsp.buf.format({ async = false })
  vim.cmd("w")
end, { noremap = true, silent = true })



require("lspconfig").phpactor.setup {
  root_dir = function(_)
    return vim.loop.cwd()
  end,
  init_options = {
    ["language_server.diagnostics_on_update"] = false,
    ["language_server.diagnostics_on_open"] = false,
    ["language_server.diagnostics_on_save"] = true,
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = true,
  },
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end
}

local null_ls = require("null-ls")

null_ls.setup {
  autostart = true,
  sources = {
    null_ls.builtins.formatting.php_cs_fixer,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.black.with({
      extra_args = { "--line-length", "79" },
    }),
  },
}
