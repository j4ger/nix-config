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
        key = "qo";
        action = ":Copilot panel<CR>";
        options.desc = "Open Copilot Panel";
    }
    {
        mode = "n";
        key = "qa";
        action = ":lua require('copilot.panel').accept()<CR>";
        options.desc = "Accept Copilot Edit";
    }
    {
        mode = "n";
        key = "qt";
        action = ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>";
        options.desc = "Toggle Copilot AutoTrigger";
    }
    {
        mode = "n";
        key = "qd";
        action = ":lua require('copilot.suggestion').dismiss()<CR>";
        options.desc = "Dismiss Copilot";
    }
    {
        mode = "n";
        key = "ql";
        action = ":lua require('copilot.suggestion').accept_line()<CR>";
        options.desc = "Accept Copilot Line Edit";
    }
    {
        mode = "n";
        key = "qw";
        action = ":lua require('copilot.suggestion').accept_word()<CR>";
        options.desc = "Accept Copilot Line Edit";
    }
    {
        mode = "n";
        key = "q]";
        action = ":lua require('copilot.suggestion').next()<CR>";
        options.desc = "Accept Copilot Line Edit";
    }
    {
        mode = "n";
        key = "q[";
        action = ":lua require('copilot.suggestion').prev()<CR>";
        options.desc = "Accept Copilot Line Edit";
    }
  ]; 
}
