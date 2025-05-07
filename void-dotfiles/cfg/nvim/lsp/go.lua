--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Go LSP                            ║
--          ╚═════════════════════════════════════════════════════════╝
return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gosum" },
  root_markers = {
    "go.mod",
    "go.sum",
  },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      staticcheck = true,
      gofumpt = true,
      semanticTokens = true,
    },
  },
}
