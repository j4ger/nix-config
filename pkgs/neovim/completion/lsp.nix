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
      cssls.enable = true;
      dartls.enable = true;
      emmet_language_server.enable = true;
      html.enable = true;
      jsonls.enable = true;
      kotlin-language-server.enable = true;
      lua-ls.enable = true;
      nil-ls.enable = true;
      nixd.enable = true;
      pylyzer.enable = true;
      ruff.enable = true;
      ruff-lsp.enable = true;
      taplo.enable = true;
      ts-ls.enable = true;
      typst-lsp.enable = true;
      svelte.enable = true;
      yamlls.enable = true;
    };
  };

  plugins.lsp-format = {
    enable = true;
  };

  plugins.trouble = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "gD";
      action = "<cmd>Trouble diagnostics toggle<CR>";
      options.desc = "Open Trouble Diagnostics";
    }
  ];
}
