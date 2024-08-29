{
  plugins = {
    fzf-lua = {
      enable = true;
      profile = "fzf-native";
      keymaps = {
        "<leader>fb" = "buffers";
        "<leader>ff" = "files";
        "<leader>fF" = "quickfix";
        "<leader>ft" = "tabs";
        "<leader>fa" = "args";
        "<leader>fg" = "live_grep_native";
        "<leader>fd" = "diagnostics_document";
        "<leader>fD" = "diagnostics_workspace";
        "<leader>fc" = "lsp_code_actions";
        "<leader>fl" = "lsp_finder";
        "<leader>fr" = "registers";
        "<leader>fk" = "keymaps";
      };
      settings = {
        files = {
          cmd = "rg --files";
        };
      };
    };

    oil = {
      enable = true;
      settings = {
        useDefaultKeymaps = true;
        deleteToTrash = true;
        float = {
            padding = 2;
            maxWidth = 0; # ''math.ceil(vim.o.lines * 0.8 - 4)'';
            maxHeight = 0; # ''math.ceil(vim.o.columns * 0.8)'';
            border = "rounded"; # 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
            winOptions = {
            winblend = 0;
            };
        };
        preview = {
          border = "rounded";
        };
        keymaps = {
            "g?" = "actions.show_help";
            "<CR>" = "actions.select";
            "<C-\\>" = "actions.select_vsplit";
            "<C-enter>" = "actions.select_split"; # this is used to navigate left
            "<C-t>" = "actions.select_tab";
            "<C-v>" = "actions.preview";
            "<C-c>" = "actions.close";
            "<C-r>" = "actions.refresh";
            "-" = "actions.parent";
            "_" = "actions.open_cwd";
            "`" = "actions.cd";
            "~" = "actions.tcd";
            "gs" = "actions.change_sort";
            "gx" = "actions.open_external";
            "g." = "actions.toggle_hidden";
            "q" = "actions.close";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "-";
      action = ":Oil<CR>";
      options = {
        desc = "Open parent dir in oil";
        silent = true;
      };
    }
  ];
}
