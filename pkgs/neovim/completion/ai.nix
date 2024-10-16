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
        key = "<A-a>";
        action = ":lua require('copilot.panel').accept()<CR>";
        options.desc = "Accept Copilot Edit";
    }
    {
        mode = "n";
        key = "<leader>mt";
        action = ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>";
        options.desc = "Toggle Copilot AutoTrigger";
    }
    {
        mode = "n";
        key = "<A-d>";
        action = ":lua require('copilot.suggestion').dismiss()<CR>";
        options.desc = "Dismiss Copilot";
    }
    {
        mode = "n";
        key = "<A-l>";
        action = ":lua require('copilot.suggestion').accept_line()<CR>";
        options.desc = "Accept Copilot Line Edit";
    }
    {
        mode = "n";
        key = "<A-w>";
        action = ":lua require('copilot.suggestion').accept_word()<CR>";
        options.desc = "Accept Copilot Word Edit";
    }
    {
        mode = "n";
        key = "<A-]>";
        action = ":lua require('copilot.suggestion').next()<CR>";
        options.desc = "Copilot Next Suggestion";
    }
    {
        mode = "n";
        key = "<A-[>";
        action = ":lua require('copilot.suggestion').prev()<CR>";
        options.desc = "Copilot Previous Suggestion";
    }
  ]; 
}
