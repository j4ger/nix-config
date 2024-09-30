{
  plugins.dap = {
    enable = true;

    extensions = {
      dap-ui.enable = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gd";
      action = "require('dapui').toggle()";
      options.desc = "Toggle DAPUI";
    }
  ];
}
