{ inputs, system, pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.nvim-nio ];
  plugins.dap = {
    enable = true;

    extensions = {
      dap-ui.enable = true;

      dap-virtual-text.enable = true;
    };

    adapters = {
      servers = {
        codelldb = let
            port = 13841;
        in {
          inherit port;
          executable = {
            command = "${inputs.rustaceanvim.packages."${system}".codelldb}/bin/codelldb";
            args = ["--port" "${builtins.toString port}"];
          };
        };
      };
    };

    configurations = {
      rust = [];
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>dt";
      action = ":lua require('dapui').toggle()<CR>";
      options.desc = "Toggle DAPUI";
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = ":lua require('dapui').open({reset = true})()<CR>";
      options.desc = "Reset DAPUI";
    }
    {
      mode = "n";
      key = "<leader>db";
      action = ":DapToggleBreakpoint<CR>";
      options.desc = "Toggle breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = ":DapContinue<CR>";
      options.desc = "Continue";
    }
    {
      mode = "n";
      key = "<leader>dk";
      action = ":DapTerminate<CR>";
      options.desc = "Kill session";
    }
    {
      mode = "n";
      key = "<leader>dsi";
      action = ":DapStepInto<CR>";
      options.desc = "Step Into";
    }
    {
      mode = "n";
      key = "<leader>dsu";
      action = ":DapStepOut<CR>";
      options.desc = "Step Out";
    }
    {
      mode = "n";
      key = "<leader>dso";
      action = ":DapStepOver<CR>";
      options.desc = "Step Over";
    }
  ];
}
