{
  pkgs,
  ...
}:
{
  plugins.better-escape = {
    enable = true;
    timeout = 100;
  };

  plugins.nvim-autopairs = {
    enable = true;
  };

  plugins.surround = {
    enable = true;
  };

  plugins.comment = {
    enable = true;
    settings = {
      opleader = {
        block = "cb";
        line = "cl";
      };
      toggler = {
        block = "<leader>cb";
        line = "<leader>cl";
      };
    };
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

  plugins.flash = {
    enable = true;

    settings = {
      modes.char.jump_labels = true;
    };
  };
}
