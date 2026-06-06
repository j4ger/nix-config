{ config, ... }:
let
  home = config.users.users.j4ger.home;
  user = config.users.users.j4ger.name;
in
{
  age = {
    identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    secrets = {
      gpg = {
        file = ../secrets/gpg.age;
        path = "${home}/.gpg/privateKey";
        owner = user;
        mode = "0600";
      };
      dae = {
        file = ../secrets/dae.age;
        mode = "0600";
        name = "dae.dae";
      };
      mihomo = {
        file = ../secrets/mihomo.age;
        mode = "0600";
        name = "mihomo.yaml";
      };
      nix-extra-options = {
        file = ../secrets/nix-extra-options.age;
        mode = "6444";
      };
    };
  };
}
