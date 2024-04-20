{ config, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''set fish_greeting ""'';
    shellAliases = {
      l = "ls -ahl";
      la = "exa -a --icons";
      ll = "exa -l --icons";
      ls = "exa";
      top = "btop";
      lg = "lazygit";
    };
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
