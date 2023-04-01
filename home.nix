{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rumia";
  home.homeDirectory = /home/rumia;

  home.stateVersion = "22.11";

  imports = [ ./tmux.nix ./zsh.nix ./vim.nix ./tools.nix ];
  # If we enable the module in other .nix files, the package will be added
  # automatically. So we don't need to declare vim here.
  home.packages = with pkgs; [
    perl
    # perl is dependency of zplug...
    nodejs
    # nodejs is dependency of vim plugin coc
    screen
    ripgrep
    fd
    exa
    bat
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  home.file = {
    ".screenrc".source = dotfiles/screenrc;
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
