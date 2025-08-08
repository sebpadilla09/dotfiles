{ config, pkgs, ... }:

{  
  #Session manager
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.defaultSession = "hyprland";
 
  # Windows compositor
  programs.hyprland = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-wlr
    ];
    configPackages = [ pkgs.hyprland ];
  };

  programs.hyprlock.enable = true;
  programs.xwayland.enable = true;

}
