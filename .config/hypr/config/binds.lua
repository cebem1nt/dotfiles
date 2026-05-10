-- ▄▄▄▄· ▪   ▐ ▄ ·▄▄▄▄  .▄▄ · 
-- ▐█ ▀█▪██ •█▌▐███▪ ██ ▐█ ▀. 
-- ▐█▀▀█▄▐█·▐█▐▐▌▐█· ▐█▌▄▀▀▀█▄
-- ██▄▪▐█▐█▌██▐█▌██. ██ ▐█▄▪▐█
-- ·▀▀▀▀ ▀▀▀▀▀ █▪▀▀▀▀▀•  ▀▀▀▀ 
--
-- https://wiki.hypr.land/Configuring/Basics/Binds/

local scripts = "~/.local/bin/"
local rofi_scripts = "~/.config/rofi/bin/"

local terminal     = "alacritty"
local file_manager = "thunar"
local code         = "vscodium"
local browser      = "zen"

-- Total workspaces used
local workspaces   = 5

local function toggle_rofi(rofi_script)
    return hl.dsp.exec_cmd(scripts .. "toggle_rofi" .. " " .. rofi_script)
end

local function run_script(script)
    return hl.dsp.exec_cmd(scripts .. script)        
end

-- Generates layout specific binds to avoid error warnings
local function layout_bind(bind_table)
    return function ()
        local layout = hl.get_config("general.layout")
   
        if bind_table[layout] then
            hl.dispatch(bind_table[layout])
        end
    end
end

hl.bind("SUPER + SEMICOLON",         hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + SHIFT + SEMICOLON", hl.dsp.exec_cmd(terminal, {float = true}))

-- Cycle layout for the workspace
hl.bind("SUPER + tab",         run_script("cycle_layout"))
hl.bind("SUPER + SHIFT + tab", run_script("cycle_layout --prev"))

hl.bind("SUPER + Q",         hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.kill())

-- Launch some apps
hl.bind("SUPER + B", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + N", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + M", hl.dsp.exec_cmd(code))

hl.bind("SUPER + W", hl.dsp.window.center()) -- Will work with floating window only
hl.bind("SUPER + U", hl.dsp.window.pin())
hl.bind("SUPER + P", hl.dsp.window.pseudo())

-- Increases / Decreases active window by x, y relatively
hl.bind("SUPER + Z", hl.dsp.window.resize({x = -80, y = -75, relative = true}))
hl.bind("SUPER + C", hl.dsp.window.resize({x =  80, y =  75, relative = true}))

hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + F", function ()
    -- Toggle window floating state and center it.
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
    hl.dispatch(hl.dsp.window.center())
end )

hl.bind("SUPER + W", layout_bind({ 
    scrolling = hl.dsp.layout("colresize +conf"),   -- If scrolling layout, set next column width from config
    dwindle   = hl.dsp.layout("movetoroot active"), -- Dwindle: make active window the root window
}))

hl.bind("SUPER + SHIFT + W", layout_bind({
    scrolling = hl.dsp.layout("colresize -conf"),  -- Scrolling: set previous column width from config
}))

hl.bind("SUPER + A", layout_bind({
    scrolling = hl.dsp.layout("swapcol l"),  -- Scrolling: swap column with left one
    dwindle   = hl.dsp.layout("swapsplit"),  -- Dwindle: swap window split 
    monocle   = hl.dsp.layout("cycleprev"),  -- Monocle and master: cycle prev window
    master    = hl.dsp.layout("cycleprev"),
}))

hl.bind("SUPER + D", layout_bind({
    scrolling = hl.dsp.layout("swapcol r"),   -- Scrolling: swap column with right one
    dwindle   = hl.dsp.layout("togglesplit"), -- Dwindle: toggle window split 
    monocle   = hl.dsp.layout("cyclenext"),   -- Monocle and master: cycle next window
    master    = hl.dsp.layout("cyclenext"),
}))

-- Minimize active window
hl.bind("SUPER + X", function ()
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
    hl.dispatch(hl.dsp.window.move({workspace = "+0"}))
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
    hl.dispatch(hl.dsp.window.move({workspace = "special:minimize"}))
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
end)

-- Group binds
hl.bind("SUPER + O",            hl.dsp.group.toggle())
hl.bind("SUPER + bracketleft",  hl.dsp.group.prev())
hl.bind("SUPER + bracketright", hl.dsp.group.next())

-- Reload hyprland config
hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Toggle swaync
hl.bind("SUPER + T", hl.dsp.exec_cmd("swaync-client -t"))

-- Rofi menus
hl.bind("SUPER + R",         toggle_rofi(rofi_scripts .. "drun"))
hl.bind("SUPER + SHIFT + R", toggle_rofi(rofi_scripts .. "run"))
hl.bind("SUPER + V",         toggle_rofi(rofi_scripts .. "clipboard"))
hl.bind("SUPER + SHIFT + V", toggle_rofi(rofi_scripts .. "icons"))
hl.bind("SUPER + E",         toggle_rofi(rofi_scripts .. "filebrowser"))
hl.bind("SUPER + ESCAPE",    toggle_rofi(rofi_scripts .. "logout"))
-- Misc rofi using scripts
hl.bind("SUPER + SHIFT + E", toggle_rofi(scripts .. "bookmarks"))
hl.bind("SUPER + Y",         toggle_rofi(scripts .. "auto_walls rofi"))

-- Switch between light and dark theme
hl.bind("SUPER + SHIFT + Y", run_script("themesw"))

-- Increase / Decrease volume
hl.bind("SUPER + MINUS", run_script("volume -2"))
hl.bind("SUPER + EQUAL", run_script("volume +2"))

hl.bind("SUPER + SHIFT + SPACE", run_script("restart_waybar"))
hl.bind("SUPER + CTRL + SPACE",  run_script("change_waybar_layout"))

-- Hide / show dock 
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("pkill -SIGRTMIN+1 -f nwg-dock-hyprland"))

-- Next / Previous track, pause music, toggle wallpaper daemon
hl.bind("SUPER + period",         hl.dsp.exec_cmd("playerctl next"))
hl.bind("SUPER + comma",          hl.dsp.exec_cmd("playerctl previous"))
hl.bind("SUPER + slash",          hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("SUPER + SHIFT + slash",  run_script("auto_walls toggle"))

-- Next / Previous wallpaper
hl.bind("SUPER + SHIFT + period", run_script("auto_walls next"))
hl.bind("SUPER + SHIFT + comma",  run_script("auto_walls prev"))

hl.bind("               Print", run_script("screenshot"))
hl.bind("       SHIFT + Print", run_script("screenshot --select"))
hl.bind("CTRL         + Print", run_script("screenrec"))
hl.bind("CTRL + SHIFT + Print", run_script("screenrec --select"))

-- Move focus SUPER + arrow keys
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind("SUPER + CTRL + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + CTRL + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + CTRL + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + CTRL + down",  hl.dsp.window.move({ direction = "down" }))

-- Swap windows
hl.bind("SUPER + CTRL + SHIFT + left",  hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + CTRL + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind("SUPER + CTRL + SHIFT + up",    hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + CTRL + SHIFT + down",  hl.dsp.window.swap({ direction = "down" }))

-- Switch workspaces: SUPER + [1-workspaces]
-- Move active window to workspace: SUPER + SHIFT [1-workspaces]
-- Move active window to workspace and follow: SUPER + CTRL [1-workspaces]
for i = 1, workspaces do
    hl.bind("SUPER + " .. i,         hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false}))
    hl.bind("SUPER + CTRL + " .. i,  hl.dsp.window.move({ workspace = i }))
end

-- Tag window
hl.bind("SUPER + 9", hl.dsp.window.tag({ tag = "bordered" }))
hl.bind("SUPER + 0", hl.dsp.window.tag({ tag = "opaque" }))

-- Special workspace
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", follow = false }))
hl.bind("SUPER + CTRL + S",  hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Misc laptop / function key binds
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl next"),                            { locked = true })
hl.bind("code:172",             hl.dsp.exec_cmd("playerctl play-pause"),                      { locked = true }) -- XF86AudioPlayPause
hl.bind("XF86AudioPause",       hl.dsp.exec_cmd("playerctl pause"),                           { locked = true })
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"),                      { locked = true })
hl.bind("XF86KbdBrightnessUp",  hl.dsp.exec_cmd("asusctl leds next"),                         { locked = true,})
hl.bind("XF86KbdBrightnessDown",hl.dsp.exec_cmd("asusctl leds prev"),                         { locked = true,})
hl.bind("Pause",                hl.dsp.exec_cmd("playerctl pause"),                           { locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl previous"),                        { locked = true })
hl.bind("XF86AudioMicMute",     run_script("mictoggle"),                                      { locked = true })
hl.bind("XF86AudioRaiseVolume", run_script("volume +5"),                                      { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", run_script("volume -5"),                                      { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  run_script("brightness 5%+"),                                 { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",run_script("brightness 5%-"),                                 { locked = true, repeating = true })

hl.bind("XF86PowerOff",         hl.dsp.exec_cmd(rofi_scripts .. "logout --shutdown")) -- Shows prompt before turning off the system
hl.bind("XF86Calculator",       hl.dsp.exec_cmd("qalculate-gtk"))
hl.bind("XF86Launch4",          hl.dsp.exec_cmd("rog-control-center"))
hl.bind("XF86Launch1",          run_script("powerprofile next"))

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
