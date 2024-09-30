{ system, inputs, ... }:
{
  plugins.rustaceanvim = {
    enable = true;

    settings = {
      dap = {
        autoloadConfigurations = true;

        adapter = {
          command = "${inputs.rustaceanvim.packages."${system}".codelldb}/bin/codelldb";
          type = "server";
        };
      };
    };
  };
}
