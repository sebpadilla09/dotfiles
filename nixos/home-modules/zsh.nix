{ config, pkgs, ... }:

{ 
  home.file.".p10k.zsh".text = builtins.readFile ./dotconfigs/zsh/p10k.zsh;
  
  home.packages = with pkgs; [
    zsh-powerlevel10k
    zsh-autosuggestions
  ];

  programs.zsh = {

    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch";
    };

    history.size = 10000;
    initContent = builtins.readFile ./dotconfigs/zsh/zshrc;
    
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };


}
