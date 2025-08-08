{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./system-modules/desktop.nix
      ./system-modules/users.nix
      ./system-modules/fonts.nix
      ./system-modules/boot.nix
      ./system-modules/packages.nix
      ./system-modules/networking.nix
      ./system-modules/sound.nix
    ];

  # Use flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Time zone.
  time.timeZone = "America/Bogota";

  console = {
    keyMap = "la-latin1";
  };

  services.power-profiles-daemon.enable = true;
  
  system.stateVersion = "25.05"; 

}

