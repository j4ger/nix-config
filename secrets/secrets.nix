let
  userKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOeaQIUbai1lTRKmjPtp4D4TDOeQOqXSs8E+lGufmUGF xiayuxuan@live.com";
  machineKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHz5sb/7HcIdWG9pkaoZlHGU8sXhD/TRsf3jjsPcb3V+ root@v04-x13";
in
{
  "gpg.age".publicKeys = [ userKey machineKey ];
  "dae.age".publicKeys = [ userKey machineKey ];
  "mihomo.age".publicKeys = [ userKey machineKey ];
  "nix-extra-options.age".publicKeys = [ userKey machineKey ];
}
