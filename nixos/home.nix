{ config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland.nix
  ];


  home.stateVersion = "24.05";
  programs.zsh.enable = true;

  home.packages = with pkgs; [
    fastfetch
  ];
}
