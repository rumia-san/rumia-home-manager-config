{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ".."="cd ..";
      egrep="egrep --color=auto";
      fgrep="fgrep --color=auto";
      grep="grep --color=auto";
      "l."="ls -d .* --color=auto";
      ll="ls -l --color=auto";
      ls="ls --color=auto";
      xzegrep="xzegrep --color=auto";
      xzfgrep="xzfgrep --color=auto";
      xzgrep="xzgrep --color=auto";
      zegrep="zegrep --color=auto";
      zfgrep="zfgrep --color=auto";
      zgrep="zgrep --color=auto";
    };
    enableAutosuggestions = true;
    enableCompletion = true;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        {
          name = "vifon/deer";
          tags = [ use:deer ];
        }
      ];
    };
    initExtra = ''
      zle -N deer
      bindkey '\ek' deer
      setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups
      zstyle ':completion:*' menu yes select
      DIRSTACKSIZE=10
    '';
  };
}

