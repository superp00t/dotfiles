# To do:

- "*:drop(active)" done, needs checking.
- Check that LibreOffice Calc's fix does not introduce any regressions somewhere else, because it required modifieng the .view selector, which is very general.
- Create new previews



# GTK4 support (in progress)
================================

To fix (already fixed with strikethrough):

- calendar buttons
- Color buttons
- popovers?
- Window control buttons: as in gtk3

- ~~Make switches the right size~~
- ~~Improve rows. Selected row: children don't have get selected background (+ borders...), only color (for gtk3 too).~~
- ~~Separators do not appear~~
- ~~Clicking on something ("active") makes it look like something selected (or, if it is a background, a bit darker)~~
- ~~Menus (popover.menu, menubar > item in GT4)~~
- ~~treeview tree~~
- ~~horizontal spinbuttons very small and different paddings when hovering~~
- ~~toolbar not looking like a toolbar (from toolbar to .toolbar)~~
- ~~entry progress not appearing~~
- ~~entry being active makes it look like selected~~
- ~~entry:hover (or something:hover) removes text shadow on entries.~~
- ~~fix undershoots! use Skewaita's~~





## Don't use -gtk-icon-theme in your CSS

GTK 4 always uses the current icon theme, with no way to change this.





## Window decorations


* .maximized decoration to window.maximized, etc ()

```css

window.maximized,
window.fullscreen,
window.tiled, window.tiled-top,
window.tiled-left,
window.tiled-right,
window.tiled-bottom {
  border-radius: 0;
}

```

Need to find titlebar colors, titlebar buttons, scrollbars, spinbuttons, statusbar, calendar (buttons, selected etc), attention-needed, some borders in notebooks
Maybe rows for page 2




