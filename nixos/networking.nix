{inputs, pkgs, config, ...}:
{  # daed - dae with a web dashboard
  services.dae = {
    enable = true;
    package = pkgs.dae;
    configFile = config.age.secrets.dae.path;
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
  };
}
