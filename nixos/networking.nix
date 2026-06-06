{
  pkgs,
  config,
  ...
}:
{
  networking.hosts = {
    "185.199.109.133" = [ "raw.githubusercontent.com" ];
    "185.199.111.133" = [ "raw.githubusercontent.com" ];
    "185.199.110.133" = [ "raw.githubusercontent.com" ];
    "185.199.108.133" = [ "raw.githubusercontent.com" ];
  };
  networking.networkmanager.enable = true;

  services.dae = {
    enable = false;
    configFile = config.age.secrets.dae.path;
    assets = with pkgs; [
      v2ray-geoip
      v2ray-domain-list-community
    ];
  };

  services.daed = {
    enable = true;
  };

  services.mihomo = {
    enable = false;
    tunMode = true;
    configFile = config.age.secrets.mihomo.path;
    webui = pkgs.metacubexd;
  };
  systemd.services.mihomo.serviceConfig.ExecStartPre = [
    "${pkgs.coreutils}/bin/ln -sf ${pkgs.v2ray-geoip}/share/v2ray/geoip.dat /var/lib/private/mihomo/GeoIP.dat"
    "${pkgs.coreutils}/bin/ln -sf ${pkgs.v2ray-domain-list-community}/share/v2ray/geosite.dat /var/lib/private/mihomo/GeoSite.dat"
  ];

}
