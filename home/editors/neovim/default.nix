{ pkgs, ... }:
{
  programs.neovim.nvimdots = {
    enable = true;
    setBuildEnv = true;
    withBuildTools = true;
  };
  home = {
    packages = (with pkgs; [
      tree-sitter
    ]);
  };
}
