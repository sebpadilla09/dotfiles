{ config, pkgs, ... }:

{ 
  home.file.".p10k.zsh".text = builtins.readFile ./dotconfigs/p10k.zsh;
  
  programs.zsh = {

    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch";
    };
  
    history.size = 10000;
    initContent = builtins.readFile ./dotconfigs/zshrc;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } 
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } 
      ];
    };
  };


}
