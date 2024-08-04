{
  pkgs,
  ...
}:
{
  plugins.better-escape = {
    enable = true;
    settings.timeout = 500;
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
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<CR>";
      options = {
        silent = true;
        desc = "save file";
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
