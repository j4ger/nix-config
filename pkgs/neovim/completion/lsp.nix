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
      html.enable = true;
      jsonls.enable = true;
      kotlin_language_server.enable = true;
      lua_ls.enable = true;
      nil_ls.enable = true;
      nixd.enable = true;
      pylyzer.enable = true;
      ruff.enable = true;
      slint_lsp.enable = true;
      svelte.enable = true;
      taplo.enable = true;
      ts_ls.enable = true;
      tinymist.enable = true;
      verible.enable = true;
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
