let
  userKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOeaQIUbai1lTRKmjPtp4D4TDOeQOqXSs8E+lGufmUGF xiayuxuan@live.com";
  machineKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHz5sb/7HcIdWG9pkaoZlHGU8sXhD/TRsf3jjsPcb3V+ root@v04-x13";
  machine2Key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOZ0U2Ltoiiobov/b3061AElmsPhDHQx9Aikd24/zwU root@v04-tx";
in {
  "gpg.age".publicKeys = [userKey machineKey machine2Key];
  "dae.age".publicKeys = [userKey machineKey machine2Key];
  "mihomo.age".publicKeys = [userKey machineKey machine2Key];
  "nix-extra-options.age".publicKeys = [userKey machineKey machine2Key];
}
