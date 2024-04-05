{
  programs = {
    git = {
      enable = true;
      userName = "j4ger";
      userEmail = "xiayuxuan@live.com";
      signing = {
        key = "A645FE4CA59374C8";
        signByDefault = true;
      };
      extraConfig = {
        url = {
          "ssh://git@github.com:j4ger" = {
            insteadOf = "https://github.com/j4ger/";
          };
        };
      };
    };
  };
}
