{ pkgs, config, ... }:
{
  sops.secrets."config.dae" = {
    mode = "0600";
  };
  services.dae = {
    enable = false;
    package = pkgs.dae;
    configFile = config.sops.secrets."config.dae".path;
    disableTxChecksumIpGeneric = false;
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
  };
  programs.clash-verge = {
    enable = true;
    autoStart = true;
    tunMode = true;
  };
}
