local modkey = 'SUPER' -- Sets "Windows" key as main modifier
local terminal = 'ghostty'
local filemanager = 'thunar'
local menu = 'hyprlauncher'
local chudbrowser = 'qutebrowser'
local musicplayer = 'jellyfin-tui'

-- see https://wiki.hypr.land/configuring/core/binds/ for more

-- Win + Enter     | open terminal
hl.bind(modkey .. ' + return', hl.dsp.exec_cmd(terminal))
-- Win + w         | open chud browser
hl.bind(modkey .. ' + w', hl.dsp.exec_cmd(chudbrowser))
-- Win + q         | close window
hl.bind(modkey .. ' + Q', hl.dsp.window.close())
-- Win + Shift + q | quit hyprland
hl.bind(modkey .. ' + SHIFT + Q',
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(modkey .. ' + E', hl.dsp.exec_cmd(filemanager))
hl.bind(modkey .. ' + V', hl.dsp.window.float({ action = 'toggle' }))
hl.bind(modkey .. ' + R', hl.dsp.exec_cmd(menu))
hl.bind(modkey .. ' + P', hl.dsp.window.pseudo())
hl.bind(modkey .. ' + M', hl.dsp.layout('togglesplit')) -- dwindle only

-- Move focus with modkey + arrow keys
hl.bind(modkey .. ' + left', hl.dsp.focus({ direction = 'left' }))
hl.bind(modkey .. ' + right', hl.dsp.focus({ direction = 'right' }))
hl.bind(modkey .. ' + up', hl.dsp.focus({ direction = 'up' }))
hl.bind(modkey .. ' + down', hl.dsp.focus({ direction = 'down' }))
-- Move focus between tiles (hjkl)
hl.bind(modkey .. ' + H', hl.dsp.focus({ direction = 'left' }))
hl.bind(modkey .. ' + J', hl.dsp.focus({ direction = 'down' }))
hl.bind(modkey .. ' + K', hl.dsp.focus({ direction = 'up' }))
hl.bind(modkey .. ' + L', hl.dsp.focus({ direction = 'right' }))
-- Move/swap the active tile position (Shift + hjkl)
hl.bind(modkey .. ' + SHIFT + H', hl.dsp.window.move({ direction = 'left' }))
hl.bind(modkey .. ' + SHIFT + J', hl.dsp.window.move({ direction = 'down' }))
hl.bind(modkey .. ' + SHIFT + K', hl.dsp.window.move({ direction = 'up' }))
hl.bind(modkey .. ' + SHIFT + L', hl.dsp.window.move({ direction = 'right' }))
-- Resize the focused window by 10
hl.bind(modkey .. ' + Tab + l', hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(modkey .. ' + Tab + h', hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(modkey .. ' + Tab + k', hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(modkey .. ' + Tab + j', hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

-- Minimize: send the focused window to a hidden special workspace
hl.bind('SUPER + N', hl.dsp.window.move({ workspace = 'special:scratch', follow = false }))

-- Pop the focused window out of special:minimized into the current workspace
hl.bind('SUPER + SHIFT + N', function()
    local hidden = hl.get_workspace_windows('special:scratch')
    local pick = hidden and hidden[#hidden]
    if not pick then return end

    hl.dispatch(hl.dsp.window.move({
        window = pick,
        workspace = hl.get_active_workspace(),
        follow = true,
    }))
end)

-- Show/hide the minimized windows
hl.bind('SUPER + B', hl.dsp.workspace.toggle_special('scratch'))

hl.bind('SUPER + F', hl.dsp.window.fullscreen({ mode = 'maximized', action = 'toggle' }))


-- Switch workspaces with modkey + [0-9]
-- Move active window to a workspace with modkey + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(modkey .. ' + ' .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(modkey .. ' + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Example special workspace (scratchpad)
hl.bind(modkey .. ' + S', hl.dsp.workspace.toggle_special('magic'))
hl.bind(modkey .. ' + SHIFT + S', hl.dsp.window.move({ workspace = 'special:magic' }))

-- Scroll through existing workspaces with modkey + Page Up/Page Down
hl.bind(modkey .. ' + page_up', hl.dsp.focus({ workspace = 'e-1' }))
hl.bind(modkey .. ' + page_down', hl.dsp.focus({ workspace = 'e+1' }))
-- Scroll through existing workspaces with modkey + [ / ]
hl.bind(modkey .. ' + bracketright', hl.dsp.focus({ workspace = 'e+1' }))
hl.bind(modkey .. ' + bracketleft', hl.dsp.focus({ workspace = 'e-1' }))
-- Scroll through existing workspaces with modkey + scroll up/scroll down
hl.bind(modkey .. ' + mouse_up', hl.dsp.focus({ workspace = 'e-1' }))
hl.bind(modkey .. ' + mouse_down', hl.dsp.focus({ workspace = 'e+1' }))

-- Move/resize windows with modkey + LMB/RMB and dragging
hl.bind(modkey .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(modkey .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'),
    { locked = true, repeating = true })
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'),
    { locked = true, repeating = true })
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'),
    { locked = true, repeating = true })
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'),
    { locked = true, repeating = true })
hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%+'), { locked = true, repeating = true })
hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%-'), { locked = true, repeating = true })

-- Requires playerctl
-- hl.bind('XF86AudioNext', hl.dsp.exec_cmd('playerctl next'), { locked = true })

-- Playpause musicplayer before playpausing something else
hl.bind(
    'Pause',
    hl.dsp.exec_cmd('playerctl play-pause --player=' .. musicplayer .. ' || playerctl play-pause'),
    { locked = true })
hl.bind(
    'KP_Begin',
    hl.dsp.exec_cmd('playerctl play-pause --player=' .. musicplayer .. ' || playerctl play-pause'),
    { locked = true })

hl.bind(
    'KP_Left',
    hl.dsp.exec_cmd('playerctl previous --player=' .. musicplayer .. ' || playerctl previous'),
    { locked = true })

hl.bind(
    'KP_Right',
    hl.dsp.exec_cmd('playerctl next --player=' .. musicplayer .. ' || playerctl next'),
    { locked = true })

-- hl.bind('XF86AudioPlay', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
-- hl.bind('XF86AudioPrev', hl.dsp.exec_cmd('playerctl previous'), { locked = true })

-- Switch to a new random wallpaper
hl.bind(modkey .. ' + Print', hl.dsp.exec_cmd('~/.local/bin/set-random-wallpaper'))
