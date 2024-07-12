{
  plugins = {
    treesitter = {
      enable = true;
      indent = true;
      folding = true;

      nixvimInjections = true;

      ensureInstalled = "all";
    };

    treesitter-context = {
      enable = true;
    };
  };
}
