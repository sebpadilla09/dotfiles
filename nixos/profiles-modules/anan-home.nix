{ config, pkgs, ... }:

{
  imports = [
    ../home-modules/hyprland.nix
    ../home-modules/development-tools.nix
    ../home-modules/zsh.nix
  ];


  home.stateVersion = "24.05";
  programs.zsh.enable = true;

  home.packages = with pkgs; [
    fastfetch
  ];
}
