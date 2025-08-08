{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
     vim 
     git
     unzip
     curl
     wget
     jq
  ];

  programs.zsh.enable = true;
}
