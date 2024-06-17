-----------------------------------------------------------
-- AutoFormate
-----------------------------------------------------------
return {
  "stevearc/conform.nvim",
    opts = {
    format = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
    },

    formatters_by_ft = {
      css = { { "prettied", "prettier" } },
      graphql = { { "prettied", "prettier" } },
      html = { { "prettied", "prettier" } },
      javascript = { { "prettied", "prettier" } },
      javascriptreact = { { "prettied", "prettier" } },
      json = { { "prettied", "prettier" } },
      lua = { "stylua" },
      markdown = { { "prettied", "prettier" } },
      python = { "isort", "black" },
      sql = { "sql-formatter" },
      svelte = { { "prettied", "prettier" } },
      typescript = { { "prettied", "prettier" } },
      typescriptreact = { { "prettied", "prettier" } },
      yaml = { "prettier" },
      -- Injected
      ["*"] = { "injected" },
    },

    formatters = {
      injected = { options = { ignore_errors = true } },
    },
  },
}
