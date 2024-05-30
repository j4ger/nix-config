{pkgs, config, ...}:
{
  services.dae = {
    enable = false;
    package = pkgs.dae;
    configFile = config.age.secrets.dae.path;
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
  };

  services.mihomo = {
    enable = true;
    tunMode = true;
    configFile = config.age.secrets.mihomo.path;
  };
}
