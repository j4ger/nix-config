{ pkgs, config, ... }:
{
  home = {
    packages = (with pkgs; [
    ]) ++ (with config.nur.repos;[
      linyinfeng.wemeet
    ]);
  };
}
