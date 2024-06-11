{ lib, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = let
      mkBind = key: action: ''
        bind=${key},${action}
        bind=${key},submap,reset'';
      resetSubmap = ''
        bind=,Return,submap,reset
        bind=,Escape,submap,reset
        submap=reset
      '';
      # setup keybindings for launching applications
    in lib.concatStrings [  ''
      submap=execute
      ${mkBind ",w" "exec,$browser"}
      ${mkBind ",e" "exec,$editor"}
      ${mkBind ",n" "exec,$notes"}
      ${mkBind ",f" "exec,$fileManager"}
    '' resetSubmap ];

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "wofi --show drun,run";
      "$dmenu" = "wofi --show dmenu";
      "$fileManager" = "thunar";
      "$notes" = "trilium";
      "$chat" = "element-desktop";
      "$editor" = "kitty nvim";
      "$browser" = "brave";

      exec-once = ["dex -a" "hyprpaper" "waybar" ];

      monitor = [
                  "DP-1,1920x1080@120,0x0,1"
                  #"HDMI-A-1,1920x1080@50,1920x0,1,disable"
                  "HDMI-A-1,disable"
                ];

      windowrulev2 = [
        "opacity 0.96, class:.*" # make all windows 4% transparent
        "opacity 1,title:^(.*)(YouTube)(.*)$" # if a window has "YouTube" in its title, remove transparency
        "opacity 1,title:^FINAL FANTASY XIV$"
        "opacity 1,class:firefox"
        #"nomaximizerequest, class:.*" # You'll probably like this.
        "suppressevent maximize, class:.*"
        "forceinput, class:.*"
        "minsize 1 1 , title:^(),class:^(steam)"
        "stayfocused,class:(steam),title:(^$)"
      ];

      input = {
        kb_layout = "de";
        kb_options = "caps:escape,compose:menu"; # override capslock with escape

        follow_mouse = 1;

        touchpad.natural_scroll = false;

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
	numlock_by_default = true;
      };

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 0;
        gaps_out = 20;
        border_size = 1;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 0;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };

        drop_shadow = false;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = true;
        preserve_split = true; # you probably want this
      };

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = true;
      };

      bind = [
        "$mod, X, submap, execute"
        "$mod+SHIFT, C, killactive"
        "$mod SHIFT, Return, exec, $terminal"
        "$mod SHIFT, C, killactive,"
        "$mod SHIFT, Q, exit,"
        "$mod SHIFT, Space,togglefloating,"
        "$mod, P, exec, $menu"
        "$mod SHIFT, P, pseudo,"
        "$mod SHIFT, J, togglesplit,"
        "$mod SHIFT, F, fullscreen"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod,Y,exec,grimblast copy area"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (x:
          let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]) 10));
      bindm = [
        "bindm = $mod, mouse:272, movewindow"
        "bindm = $mod, mouse:273, resizewindow"
      ];
    };
  };
}
