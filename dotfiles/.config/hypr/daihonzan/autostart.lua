-- See https://wiki.hypr.land/configuring/core/autostart/
--
hl.on('hyprland.start', function()
    hl.exec_cmd('hyprpaper')
    hl.exec_cmd('sleep 2 && ~/.local/bin/set-random-wallpaper')
    hl.exec_cmd('ashell')

    -- themes
    hl.exec_cmd('gsettings set org.gnome.desktop.interface font-name "Signika Regular 10"')

    hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "mac-os-x-cheetah-dark"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface icon-theme "buuf-nestort"')

    -- set file associations
    hl.exec_cmd('xdg-mime default imv-dir.desktop image/jpeg image/png image/gif image/webp image/svg+xml image/tiff')
    hl.exec_cmd('xdg-mime default mpv.desktop video/mp4 video/x-matroska video/webm video/avi video/quicktime')
end)
