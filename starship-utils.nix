 let lib = import <nixpkgs/lib>;
 in
 rec {
  transitionColor = ({ bg, fg, ... }@color1:
    { bg, fg, ... }@color2: lib.concatStrings [
      (if color1?bg then "fg:${color1.bg}" else "")
      " "
      (if color2?bg then "bg:${color2.bg}" else "") ]);

  color = {
    show = color: lib.concatStrings [
      (if color?bg then "bg:${color.bg}" else "")
      " "
      (if color?fg then "fg:${color.fg}" else "")
    ];
    invert = { bg, fg, ... }: {
      fg = bg;
      bg = fg;
    };
    transition = transitionColor;
  };
  nextWidget = (color1: color2:
    "[](${transitionColor color1 color2})");

  showWidget = { content, ... }@widget:
    "[${content}](${color.show widget})";
  startPrompt = widget: "[](${color.show widget})";
  endPrompt = widget: "[](fg:${widget.bg})";
  makeFormatString =widgets:
  lib.concatStrings (lib.flatten (map (w:
    let
      firstWidget = builtins.head widgets;
      lastWidget = lib.last widgets;
      succedingWidget =
        let index = lib.lists.findFirstIndex (x: x == w) null widgets;
        in if index == null then lastWidget else lib.elemAt widgets (index+1);
    in (if w == firstWidget then
      [ (startPrompt w) ]
    else
      []) ++ [ (showWidget w) ]
    ++ (if w == lastWidget then
      [ (endPrompt w) ]
    else
      [ (nextWidget w succedingWidget) ])) widgets));

}
