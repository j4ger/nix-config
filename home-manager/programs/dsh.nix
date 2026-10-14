{
  pkgs,
  inputs,
  system,
  ...
}: {
  # DeepSeek Harness
  home.packages = [
    inputs.llm-agents.packages.${system}.dsh
  ];
}
