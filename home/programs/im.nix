{ pkgs, config, ... }:
{
  home = {
    packages = (with pkgs; [
      qq
    ]) ++ (with config.nur.repos;[
    ]);
  };
}
