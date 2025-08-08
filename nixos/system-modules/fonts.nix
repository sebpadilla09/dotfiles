{ config, pkgs, ... }:

{  
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.roboto-mono
    nerd-fonts.meslo-lg
  ];
}
