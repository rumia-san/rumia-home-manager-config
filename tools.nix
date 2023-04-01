{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "rumia";
    userEmail = "rumia-san@outlook.com";
    aliases = {
      cp = "cherry-pick";
    };
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.starship = {
    enable = true;
  };
}
