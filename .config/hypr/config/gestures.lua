--  ▄▄ • ▄▄▄ ..▄▄ · ▄▄▄▄▄▄• ▄▌▄▄▄  ▄▄▄ ..▄▄ · 
-- ▐█ ▀ ▪▀▄.▀·▐█ ▀. •██  █▪██▌▀▄ █·▀▄.▀·▐█ ▀. 
-- ▄█ ▀█▄▐▀▀▪▄▄▀▀▀█▄ ▐█.▪█▌▐█▌▐▀▀▄ ▐▀▀▪▄▄▀▀▀█▄
-- ▐█▄▪▐█▐█▄▄▌▐█▄▪▐█ ▐█▌·▐█▄█▌▐█•█▌▐█▄▄▌▐█▄▪▐█
-- ·▀▀▀▀  ▀▀▀  ▀▀▀▀  ▀▀▀  ▀▀▀ .▀  ▀ ▀▀▀  ▀▀▀▀ 
--
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/

hl.gesture({
    fingers = 3,
    direction = "up",
    mods = "SUPER",
    action = function ()
        hl.dispatch(hl.dsp.focus({ workspace = "+1" }))
    end
})

hl.gesture({
    fingers = 3,
    direction = "down",
    mods = "SUPER",
    action = function ()
        hl.dispatch(hl.dsp.focus({ workspace = "-1" }))
    end
})

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "workspace"
})

hl.gesture({
    fingers = 3,
    direction = "left",
    action = function ()
        hl.dispatch(hl.dsp.focus({ direction = "right" }))
    end
})

hl.gesture({
    fingers = 3,
    direction = "right",
    action = function ()
        hl.dispatch(hl.dsp.focus({ direction = "left" }))
    end
})

-- Fullscreen on at pinchin gesture with 4 fingers 
hl.gesture({ 
    fingers = 4, 
    direction = "pinchout", 
    action = function ()
        hl.dispatch(hl.dsp.window.fullscreen({ action="set" })) 
    end
})

-- Fullscreen off at pinchin gesture with 4 fingers 
hl.gesture({ 
    fingers = 4, 
    direction = "pinchin", action = function ()
        hl.dispatch(hl.dsp.window.fullscreen({ action="unset" })) 
    end
})

-- Special workspace on 4 fingers vertial swipe
hl.gesture({
    fingers = 4,
    direction = "vertical",
    action = "special",
    workspace_name = "magic"
})
