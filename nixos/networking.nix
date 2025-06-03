{
  pkgs,
  config,
  lib,
  myPackages,
  system,
  inputs,
  ...
}: {
  services.dae = {
    enable = false;
    configFile = config.age.secrets.dae.path;
    assets = with pkgs; [v2ray-geoip v2ray-domain-list-community];
  };

  services.daed = {
    enable = false;
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

  # programs.clash-verge.autoStart = false;
  # systemd.services.clash-verge-rev = {
  #   enable = false;
  #   description = "clash verge rev";
  #   serviceConfig = {
  #     ExecStart = "${pkgs.clash-verge-rev}/bin/clash-verge-service";
  #   };
  #   wantedBy = [ "multi-user.target" ];
  # };
  #  environment.systemPackages = with pkgs; [ clash-verge-rev ];

  # security.wrappers.hiddify = {
  #   owner = "root";
  #   group = "root";
  #   capabilities = "cap_net_bind_service,cap_net_admin=+ep";
  #   source = "${pkgs.hiddify-app}/bin/hiddify";
  # };
  # systemd.user.services.hiddify = {
  #   enable = false;
  #   description = "Start hiddify-app";
  #   serviceConfig = {
  #     Type = "simple";
  #     ExecStart = "${config.security.wrapperDir}/hiddify";
  #   };
  #   wantedBy = [ "multi-user.target" ];
  #   after = [ "NetworkManager.service" ];
  # };

  # services.v2raya.enable = true;

  # security.wrappers.mihomo = {
  #   owner = "root";
  #   group = "root";
  #   capabilities = "cap_net_bind_service,cap_net_admin=+ep";
  #   source = "${lib.getExe pkgs.mihomo}";
  # };
  # security.wrappers.mihomo-party = {
  #   owner = "root";
  #   group = "root";
  #   capabilities = "cap_net_bind_service,cap_net_admin=+ep";
  #   source = "${lib.getExe myPackages.${system}.mihomo-party}";
  # };

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
  };
}
