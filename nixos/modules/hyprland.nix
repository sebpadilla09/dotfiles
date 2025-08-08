{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    # La sintaxis es la misma que la de un archivo hyprland.conf, pero usando Nix.
    settings = {
      #Programs variables
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";
      "$browser" = "firefox";

      #Key variables
      "$mod" = "SUPER";

      # Execute once
      "exec-once" = [
        "waybar &"
      ];
      
      # Env variables
      env = [
        "XCURSOR_SIZE,24"
	"HYPRCURSOR_SIZE,24"
      ];

      monitor = [
       ",preferred,auto,1.25"
      ];

      general = {
        gaps_in = 5;
	gaps_out = 10;

	border_size = 2;

	"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
	"col.inactive_border" = "rgba(595959aa)";

	resize_on_border = false;
	allow_tearing = false;
	layout = "dwindle";
      };

      decoration = {
        rounding = 6;
	rounding_power = 2;

	# transparency
	active_opacity = 1.0;
	inactive_opacity = 1.0;
        
	shadow = {
	  enabled = true;
	  range = 4;
	  render_power = 3;
	  color = "rgba(1a1a1aee)";
	};

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

	  vibrancy = 0.1696;
        };
      };

      animations = {
          enabled = true;
       
          bezier = [
	    "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
	  ];
      
          animation = [
	    "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
	  ];
      };

      
      dwindle = {
          pseudotile = true; 
          preserve_split = true; 
      };
      
      master = {
          new_status = "master";
      };
      
      misc = {
          force_default_wallpaper = -1; 
          disable_hyprland_logo = false; 
      };
       
      input = {
          kb_layout = "latam"; 
          follow_mouse = 1;
      
          sensitivity = 0; 
      
          touchpad = {
              natural_scroll = false;
          };
      };

      gestures = {
        workspace_swipe = true;
      };


      bind = [
        "$mod, RETURN, exec, $terminal"
	"$mod, B, exec, $browser"
	"$mod, R, exec, $menu"
        "$mod, E, exec, $fileManager"
        "$mod, C, killactive,"
        "$mod, M, exit,"
        "$mod, V, togglefloating,"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
	"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
 
    };
  };

  # Los paquetes que solo necesitas para Hyprland
  home.packages = with pkgs; [
    kitty
    firefox
    wofi
    sway
    hyprpaper
    grimblast
  ];
}
