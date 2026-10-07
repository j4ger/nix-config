{ pkgs, inputs, system, ... }:
{
  home.packages = [
    inputs.llm-agents.packages.${system}.zcode
  ];
}
