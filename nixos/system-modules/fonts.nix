{ config, pkgs, ... }:

{  
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    fira-code
    nerd-fonts.jetbrains-mono
  ];
}
