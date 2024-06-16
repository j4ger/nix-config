{
  myPackages
  , system
  ,...
}:
{
  home.packages = [
    myPackages.${system}.mynvim
  ];
}
