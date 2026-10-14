{
  pkgs,
  inputs,
  system,
  ...
}: {
  home.packages = [
    inputs.llm-agents.packages.${system}.antigravity-cli
  ];
}
