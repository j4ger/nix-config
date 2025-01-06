{pkgs, ...}: {
  extraPackages = with pkgs; [
    vscode-extensions.vadimcn.vscode-lldb.adapter
  ];
  plugins = {
    rustaceanvim = {
      enable = true;
      settings = {
        auto_focus = true;
        dap = {
          autoloadConfigurations = true;
        };
        server = {
          default_settings = {
            rust-analyzer = {
              cargo = {
                allFeatures = true;
                loadOutDirsFromCheck = true;
                runBuildScripts = true;
              };
            };
          };
        };
        tools = {
          executor = "toggleterm";
          onInitialized =
            /*
            lua
            */
            ''
              function()
                vim.notify("successfully initialized rust-analyzer")
              end
            '';
        };
      };
    };
  };
  keymaps = [
    {
      action =
        /*
        lua
        */
        ''
          function()
            vim.cmd.RustLsp('codeAction')
          end
        '';
      key = "<leader>a";
      mode = "n";
      options = {
        desc = "Rust Action";
        silent = true;
      };
    }
    {
      action = ":RustLsp runnables<CR>";
      key = "<leader>ar";
      mode = "n";
      options = {
        desc = "Find rust runnables";
        silent = true;
      };
    }
    {
      action = ":RustLsp testables<CR>";
      key = "<leader>at";
      mode = "n";
      options = {
        desc = "Find rust testables";
        silent = true;
      };
    }
    {
      action = ":RustLsp debuggables<CR>";
      key = "<leader>ad";
      mode = "n";
      options = {
        desc = "Find rust debuggables";
        silent = true;
      };
    }
    {
      action = ":RustLsp testables last<CR>";
      key = "<leader>aT";
      mode = "n";
      options = {
        desc = "Run last rust test";
        silent = true;
      };
    }
  ];
}
