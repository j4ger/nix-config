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
        key = "mo";
        action = ":Copilot panel<CR>";
        options.desc = "Open Copilot Panel";
    }
    {
        mode = "n";
        key = "ma";
        action = "require('copilot.panel').accept()";
        options.desc = "Accept Copilot Edit";
    }
    {
        mode = "n";
        key = "mt";
        action = "require('copilot.suggestion').toggle_auto_trigger()";
        options.desc = "Toggle Copilot AutoTrigger";
    }
    {
        mode = "n";
        key = "md";
        action = "require('copilot.suggestion').dismiss()";
        options.desc = "Dismiss Copilot";
    }
    {
        mode = "n";
        key = "ml";
        action = "require('copilot.suggestion').accept_line()";
        options.desc = "Accept Copilot Line Edit";
    }
    {
        mode = "n";
        key = "mw";
        action = "require('copilot.suggestion').accept_word()";
        options.desc = "Accept Copilot Line Edit";
    }
    {
        mode = "n";
        key = "m]";
        action = "require('copilot.suggestion').next()";
        options.desc = "Accept Copilot Line Edit";
    }
    {
        mode = "n";
        key = "m[";
        action = "require('copilot.suggestion').prev()";
        options.desc = "Accept Copilot Line Edit";
    }
  ]; 
}
