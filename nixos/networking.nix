{ pkgs, config, ...}:
{
  services.dae = {
    enable = true;
    package = pkgs.dae;
    configFile = config.age.secrets.dae.path;
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
  };

  services.mihomo = {
    enable = false;
    tunMode = true;
    configFile = config.age.secrets.mihomo.path;
    webui = pkgs.nur.repos.guanran928.metacubexd;
  };
  systemd.services.mihomo.serviceConfig.ExecStartPre = [
    "${pkgs.coreutils}/bin/ln -sf ${pkgs.v2ray-geoip}/share/v2ray/geoip.dat /var/lib/private/mihomo/GeoIP.dat"
    "${pkgs.coreutils}/bin/ln -sf ${pkgs.v2ray-domain-list-community}/share/v2ray/geosite.dat /var/lib/private/mihomo/GeoSite.dat"
  ];

  programs.clash-verge = {
    enable = false;
    tunMode = true;
    autoStart = true;
    package = pkgs.clash-verge-rev;
  };
}

