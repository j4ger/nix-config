{
  pkgs,
  inputs,
  system,
  ...
}: {
  home.packages = [
    inputs.llm-agents.packages.${system}.chatgpt
    inputs.llm-agents.packages.${system}.codex
  ];
}
