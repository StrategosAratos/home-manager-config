{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig =
   ''

      submap=execute
      bind=,Escape,submap,reset
      bind=,w,exec,brave
      bind=,w,submap,reset
      bind=,e,exec,emacs
      bind=,e,submap,reset
      bind=,n,exec,$notes
      bind=,n,submap,reset
      bind=,f,exec,$fileManager
      bind=,f,submap,reset
      bind=,Return,submap,reset

      submap=reset

    '';

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "wofi --show drun,run";
      "$dmenu" = "wofi --show dmenu";
      "$fileManager" = "pcmanfm";
      "$notes" = "obsidian";
      "$chat" = "element-desktop";

      exec-once = [
        "hyprpaper"
        "waybar"
      ];

      monitor = ["eDP-1,1920x1080,0x0,1"];

      windowrulev2 = [
       "opacity 0.96, class:.*" # make all windows 4% transparent
       "opacity 1,title:^(.*)(YouTube)(.*)$" # if a window has "YouTube" in its title, remove transparency
      ];

      input = {
        kb_layout = "us";
        kb_options = "caps:escape,compose:menu";

        follow_mouse = 1;

        touchpad = { natural_scroll = false; };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 10;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile =
          true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
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
        "$mod SHIFT, P, exec, $dmenu"
        "$mod SHIFT, P, pseudo,"
        "$mod SHIFT, J, togglesplit,"
        "$mod SHIFT, F, fullscreen"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod,Y,exec,grimshot copy area"
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