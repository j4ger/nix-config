{
  plugins.better-escape = {
    enable = true;
    timeout = 100;
  };

  plugins.nvim-autopairs = {
    enable = true;
  };

  plugins.undotree = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>ut";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        silent = true;
        desc = "Show UndoTree";
      };
    }
  ];
}
