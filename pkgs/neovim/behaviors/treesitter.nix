{pkgs, ...}
: {
  plugins.treesitter = {
    enable = true;
    nixvimInjections = true;

    settings = {
      indent.enable = true;
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "V";
          node_incremental = "<C-Right>";
          node_decremental = "<C-Left>";
          scope_incremental = "<C-S-Right>";
        };
      };

      auto_install = true;
      highlight.enable = true;
    };

    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
  };

  plugins.treesitter-context = {
    enable = true;
  };
}
