{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];

  programs.zsh = {
    dotDir = ".config/zsh";
    zsh.initExtraBeforeCompInit = builtins.readFile ./dotconfigs/zshrc;
  };

  home.file.".p10k.zsh".text = builtins.readFile ./dotconfigs/p10k.zsh;

}
