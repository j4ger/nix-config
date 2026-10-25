{
  config,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    inputs.dsh.homeModules.default
  ];

  programs.dsh = {
    enable = true;
    profiles.web = {
      bundles = [pkgs.dsh.bundles.web-app];
      mode = "managed";
    };
    defaultProfile = config.programs.dsh.profiles.web.materializedName;
  };

  # DeepSeek Harness web service (systemd user unit: dsh-web)
  # Accessible at http://127.0.0.1:3080
  services.dsh = {
    enable = true;
    port = 3080;
  };

  home.packages = with inputs.llm-agents.packages.${system}; [
    antigravity-cli
    cli-proxy-api
    codebuddy-code
    zcode
  ];
}
