{ pkgs, ... }:
{
  # Common CLI tools shared across all window managers
  home.packages = with pkgs; [
    # File utilities
    fd
    bat
    ripgrep
    dust
    tree-sitter
    
    # System utilities
    libnotify
    usbutils
    micro
    
    # Development tools
    uv
    bun
    nodejs
    rtk
    
    # Archive/compression
    ouch
    
    # Hardware
    tio
    
    # Image viewer
    qimgv
    ueberzugpp
    
    # Container tools
    distrobox
  ];

  programs = {
    # Shell
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting ""
        fish_add_path ~/.bun/bin
      '';
      shellAliases = {
        l = "ls -ahl";
        la = "eza -a --icons";
        ll = "eza -l --icons";
        ls = "eza";
        top = "btop";
        lg = "lazygit";
        nhus = "nh os switch . --update -- --show-trace";
        nhs = "nh os switch . -- --show-trace";
        hms = "home-manager switch --flake .";
        hmus = "home-manager switch --flake . --update-input nixpkgs";
        ze = "zeditor .";
      };
    };

    # Modern CLI replacements
    eza.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    # Shell prompt
    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    # History
    atuin = {
      enable = true;
      enableFishIntegration = true;
    };

    # System monitoring
    btop.enable = true;

    # Git
    git = {
      enable = true;
      settings = {
        user = {
          name = "j4ger";
          email = "xiayuxuan@live.com";
        };
        url = {
          "ssh://git@github.com:j4ger" = {
            insteadOf = "https://github.com/j4ger/";
          };
        };
      };
    };

    # SSH
    ssh = {
      enable = true;
      extraConfig = ''
        Host github.com
        Hostname ssh.github.com
        Port 443
        User git
      '';
    };

    # Git TUI
    lazygit.enable = true;

    # Download
    yt-dlp.enable = true;

    # Nix tools
    nix-index.enable = true;
  };
}
