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
    {
      mode = "t";
      key = "<C-o>";
      action = "<C-\\><C-n>";
      options = {
        desc = "Exit terminal mode";
        silent = true;
      };
    }
  ];
}
