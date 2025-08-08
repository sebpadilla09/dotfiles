{ config, pkgs, ... }:

{
  users.users.anan = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user. 
  };

  users.defaultUserShell = pkgs.zsh;
}
