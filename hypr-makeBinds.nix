submaps:
let makeBinding = submap: keybinding: action: "";
in (let
  makeSubmap = x: builtins.concatLists (builtins.attrValues (builtins.mapAttrs (submapName: submapValue: builtins.attrValues (builtins.mapAttrs (makeBinding submapName) submapValue)) x));
in (let
  makeConfig = submaps:
    builtins.concatStringsSep "\n" (builtins.concatLists
      (builtins.attrValues (builtins.mapAttrs makeSubmap submaps)));
in makeConfig submaps))
