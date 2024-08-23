{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    keymaps = {
      silent = true;
      lspBuf = {
        "<leader>gd" = "definition";
        "<leader>gR" = "references";
        "<leader>gt" = "type_definition";
        "<leader>gi" = "implementation";
        "<leader>gk" = "hover";
        "<leader>gr" = "rename";
      };
    };

    servers = {
      clangd.enable = true;
      cmake.enable = true;
      dartls.enable = true;
      jsonls.enable = true;
      kotlin-language-server.enable = true;
      lua-ls.enable = true;
      nil-ls.enable = true;
      nixd.enable = true;
      pylyzer.enable = true;
      ruff.enable = true;
      ruff-lsp.enable = true;
      taplo.enable = true;
      # FIXME: temp fix
      typst-lsp.enable = false;
      yamlls.enable = true;
    };
  };

  plugins.lsp-format = {
    enable = true;
  };
}
