{ config, pkgs, lib, ... }:
let
  git-blame = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "git-blame.vim";
    src = pkgs.fetchFromGitHub {
      owner = "rumia-san";
      repo = "git-blame.vim";
      rev = "v0.0.1";
      sha256 = "sha256-MnmYMYYSLcoriGafJKv9cTLMnEDSEMpvLmKmwlgv6xs=";
    };
  };
  vim-ingo-library = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "vim-ingo-library";
    src = pkgs.fetchFromGitHub {
      owner = "inkarkat";
      repo = "vim-ingo-library";
      rev = "1.044";
      sha256 = "sha256-tHY/sQv+y9Sv7f/njegx7coxKZFPTRe7tQhSkVbquKQ=";
    };
  };
  vim-mark = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "vim-mark";
    src = pkgs.fetchFromGitHub {
      owner = "inkarkat";
      repo = "vim-mark";
      rev = "3.2.0";
      sha256 = "sha256-doo+WQaL7pYq6b5VBdr4EZ7lgUzieNps0r0NvLdJP+4=";
    };
  };
  vim-log-highlighting = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "vim-log-highlighting";
    src = pkgs.fetchFromGitHub {
      owner = "mtdl9";
      repo = "vim-log-highlighting";
      rev = "v1.0.0";
      sha256 = "sha256-OtPNGa73CLKXJQJgDJNHiGZc7/nQUnZSpZXsBr1KRts=";
    };
  };
in
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      fzf-vim
      #vim-airline
      lightline-vim
      lightline-bufferline
      vim-cpp-enhanced-highlight
      tagbar
      a-vim
      ack-vim
      nord-vim
      onedark-vim
      vim-unimpaired
      #vim-signify
      coc-nvim
      git-blame
      vim-ingo-library
      vim-mark
      vim-log-highlighting
      vim-nix
    ];
    extraConfig = builtins.concatStringsSep "\n" [
      # Common Settings
      (lib.strings.fileContents ./dotfiles/extra_config.vim)
      # Settings for Plugins
      (lib.strings.fileContents ./dotfiles/plugin_config.vim)
    ];
  };
}
