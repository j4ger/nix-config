{
  plugins = {
    copilot-chat = {
      enable = true;
    };
    copilot-lua = {
      enable = true;
      extraOptions = {
        panel = {
          auto_refresh = true;
        };
      };
      suggestion.keymap = {
        accept = "<C-a>";
        acceptLine = "<C-i>";
        acceptWord = "<C-o>";
        dismiss = "<C-b>";
        next = "<C-n>";
        prev = "<C-p>";
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>mo";
      action = ":Copilot panel<CR>";
      options.desc = "Open Copilot Panel";
    }
    {
      mode = "n";
      key = "<leader>mt";
      action = ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>";
      options.desc = "Toggle Copilot AutoTrigger";
    }
  ];
}
