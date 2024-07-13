{
  plugins.neogit = {
    enable = true;

    settings = {
      popup.kind = "floating";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>Gc";
      action = "<cmd>Neogit commit<CR>";
      options = {
        silent = true;
        desc = "git commit";
      };
    }
    {
      mode = "n";
      key = "<leader>Gg";
      action = "<cmd>Neogit<CR>";
      options = {
        silent = true;
        desc = "git status";
      };
    }
    {
      mode = "n";
      key = "<leader>GP";
      action = "<cmd>Neogit push<CR>";
      options = {
        silent = true;
        desc = "git push";
      };
    }
    {
      mode = "n";
      key = "<leader>Gp";
      action = "<cmd>Neogit pull<CR>";
      options = {
        silent = true;
        desc = "git pull";
      };
    }
    {
      mode = "n";
      key = "<leader>Gf";
      action = "<cmd>Neogit fetch<CR>";
      options = {
        silent = true;
        desc = "git fetch";
      };
    }
    {
      mode = "n";
      key = "<leader>Gm";
      action = "<cmd>Neogit merge<CR>";
      options = {
        silent = true;
        desc = "git merge";
      };
    }
    {
      mode = "n";
      key = "<leader>Gr";
      action = "<cmd>Neogit reset<CR>";
      options = {
        silent = true;
        desc = "git reset";
      };
    }
    {
      mode = "n";
      key = "<leader>GR";
      action = "<cmd>Neogit revert<CR>";
      options = {
        silent = true;
        desc = "git revert";
      };
    }
    {
      mode = "n";
      key = "<leader>Gs";
      action = "<cmd>Neogit stash<CR>";
      options = {
        silent = true;
        desc = "git stash";
      };
    }
    {
      mode = "n";
      key = "<leader>Gb";
      action = "<cmd>Neogit branch<CR>";
      options = {
        silent = true;
        desc = "git branch";
      };
    }
  ];
}
