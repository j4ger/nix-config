{ pkgs, config, ... }:
{
  home = {
    packages = (with pkgs; [
      wemeet
    ]) ++ (with config.nur.repos;[
    ]);
  };
}
