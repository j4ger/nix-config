{
  plugins.toggleterm = {
    enable = true;
    settings = {
      autochdir = true;
      direction = "float";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-t>";
      action = ":ToggleTerm<CR>";
      options = {
        desc = "Toggle floating terminal";
        silent = true;
      };
    }
  ];

}
