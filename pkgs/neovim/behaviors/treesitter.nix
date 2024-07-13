{
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
    };
  };

  plugins.treesitter-context = {
    enable = true;
  };
}
