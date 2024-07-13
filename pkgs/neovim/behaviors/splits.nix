{
  plugins.smart-splits = {
    enable = true;
  };

  keymaps = [
    {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Move to left split";
    }
    {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>j";
        options.desc = "Move to below split";
    }
    {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Move to above split";
    }
    {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Move to right split";
    }
    {
        mode = "n";
        key = "<M-k>";
        action = "<Cmd>resize -2<CR>";
        options.desc = "Resize split up";
    }
    {
        mode = "n";
        key = "<M-j>";
        action = "<Cmd>resize +2<CR>";
        options.desc = "Resize split down";
    }
    {
        mode = "n";
        key = "<M-h>";
        action = "<Cmd>vertical resize -2<CR>";
        options.desc = "Resize split left";
    }
    {
        mode = "n";
        key = "<M-l>";
        action = "<Cmd>vertical resize +2<CR>";
        options.desc = "Resize split right";
    }
  ];
}
