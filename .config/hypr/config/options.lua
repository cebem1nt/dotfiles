-- .▄▄ · ▄▄▄ .▄▄▄▄▄▄▄▄▄▄▪   ▐ ▄  ▄▄ • .▄▄ · 
-- ▐█ ▀. ▀▄.▀·•██  •██  ██ •█▌▐█▐█ ▀ ▪▐█ ▀. 
-- ▄▀▀▀█▄▐▀▀▪▄ ▐█.▪ ▐█.▪▐█·▐█▐▐▌▄█ ▀█▄▄▀▀▀█▄
-- ▐█▄▪▐█▐█▄▄▌ ▐█▌· ▐█▌·▐█▌██▐█▌▐█▄▪▐█▐█▄▪▐█
--  ▀▀▀▀  ▀▀▀  ▀▀▀  ▀▀▀ ▀▀▀▀▀ █▪·▀▀▀▀  ▀▀▀▀ 
--
-- https://wiki.hypr.land/Configuring/Basics/Variables/

local colors = require("config.colors") -- Dynamic color scheme for border/misc colors

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,
        border_size = 0,

        col = {
            active_border = colors.border.active,
            inactive_border = colors.border.inactive,
        },

        -- if true, will not fall back to the next available window 
        -- when moving focus in a direction where no window was found
        no_focus_fallback = true,
        layout = "scrolling",
    },

    dwindle = {
        preserve_split = true,

        -- specifies the scale factor of windows on the special workspace
        -- AKA extra gaps for special workspaces
        special_scale_factor = 0.95,
    },

    master = {
        new_on_top = true,
        new_status = "master",
        special_scale_factor = 0.95,
    },

    scrolling = {
        explicit_column_widths = "0.5, 0.6, 0.9, 1.0",
        column_width = 0.6,

        -- when a window is focused, require that at least 
        -- a given fraction of it is visible for focus to follow. [0.0 - 1.0]
        -- 1.0 -> follow only on hard input
        follow_min_visible = 1.0,

        -- When a column is focused, what method should be used to bring it into view. 
        -- 0: center,
        -- 1: fit
        focus_fit_method = 0,

        -- When enabled, causes hl.dsp.layoutmsg("swapcol l/r") to wrap around at the beginning and end.
        wrap_swapcol = false,
    },

    group = {
        col = {
            border_active = colors.group.active,
            border_inactive = colors.group.inactive,
        },

        groupbar = {
            col = {
                active = colors.groupbar.active,
                inactive = colors.groupbar.inactive,
            },

            font_weight_active = "bold",
            font_weight_inactive = "bold",
            
            gradients = true,
            font_size = 14,
            height = 24,
            gradient_rounding = 10,
            text_color = colors.group.text,

            indicator_height = 0,
            indicator_gap = 2,
            keep_upper_gap = false,
        }
    },

    decoration = {
        rounding = 15,

        dim_inactive = false,
        dim_strength = 0.12,

        blur = {
            enabled = false,
            passes = 2,
        },
        
        shadow = {
            enabled = false,
        }
    },

    input = {
        follow_mouse = 1,
        sensitivity = -0.2,
        numlock_by_default = true,

        -- 0: disabled
        -- 1: focus will change to the window under the cursor 
        --    when changing from tiled-to-floating and vice versa
        -- 2: focus will also follow mouse on float-to-float switches.
        float_switch_override_focus = 0,

        -- Controls the window focus behavior when a window is closed. 
        -- 0: focus will shift to the next window candidate. 
        -- 1: focus will shift to the window under the cursor. 
        -- 2: focus will shift to the most recently used/active window.
        focus_on_close = 1,

        touchpad = {
            scroll_factor = 0.2,
            natural_scroll = true,
            disable_while_typing = false,

            -- Button presses with 1, 2, or 3 fingers will be mapped to LMB, RMB, and MMB respectively. 
            -- This disables interpretation of clicks based on location on the touchpad.
            clickfinger_behavior = true,
        }
    },

    cursor = {
        inactive_timeout = 10,
        enable_hyprcursor = false,
    },

    misc = {
        -- Disable default random wallpaper
        force_default_wallpaper = 0,

        disable_autoreload = true, -- I use SUPER CTRL + R instead
        disable_hyprland_logo = true,

        -- Whether Hyprland should focus an app that requests to be focused (an activate request)
        focus_on_activate = true,

        -- if there is a fullscreen or maximized window, 
        -- decide whether a tiled window requested to focus should replace it, 
        -- stay behind or disable the fullscreen/maximized state. 
        -- 0: ignore focus request (keep focus on fullscreen window) 
        -- 1: takes over 
        -- 2: unfullscreen/unmaximize
        on_focus_under_fullscreen = 1,

        -- controls the VRR (Adaptive Sync) of your monitors. 
        -- 0: off 
        -- 1: on
        -- 2: fullscreen only
        -- 3: fullscreen with video or game content type
        vrr = 2,

        -- Disable "App not responding" dialog
        enable_anr_dialog = false,
    },


    xwayland = {
        enabled = true,
        force_zero_scaling = true,
    },

    binds = {
        -- If enabled, an attempt to switch to the currently focused workspace 
        -- will instead switch to the previous workspace. Akin to i3's auto_back_and_forth
        workspace_back_and_forth = true,

        hide_special_on_workspace_change = true,
        movefocus_cycles_fullscreen = true,
    },

    render = {
        -- Whether the color management pipeline should be enabled or not 
        -- (requires a restart of Hyprland to fully take effect)
        cm_enabled = true,

        -- Report content type to allow monitor profile autoswitch 
        -- (may result in a black screen during the switch)
        send_content_type = false,
    },

    ecosystem = {
        no_update_news = true,
        no_donation_nag = true, -- Sorry :(
    },


    gestures = {
        workspace_swipe_distance = 1000,
        workspace_swipe_min_speed_to_force = 1000,
        workspace_swipe_direction_lock = false,
        workspace_swipe_create_new = false,
        workspace_swipe_cancel_ratio = 0.1,
    }
})
