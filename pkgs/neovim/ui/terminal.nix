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
      key = "<C-o>";
      action = ":ToggleTerm<CR>";
      options = {
        desc = "Toggle floating terminal";
        silent = true;
      };
    }
  ];

}
