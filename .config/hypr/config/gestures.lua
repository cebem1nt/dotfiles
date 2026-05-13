--  ▄▄ • ▄▄▄ ..▄▄ · ▄▄▄▄▄▄• ▄▌▄▄▄  ▄▄▄ ..▄▄ · 
-- ▐█ ▀ ▪▀▄.▀·▐█ ▀. •██  █▪██▌▀▄ █·▀▄.▀·▐█ ▀. 
-- ▄█ ▀█▄▐▀▀▪▄▄▀▀▀█▄ ▐█.▪█▌▐█▌▐▀▀▄ ▐▀▀▪▄▄▀▀▀█▄
-- ▐█▄▪▐█▐█▄▄▌▐█▄▪▐█ ▐█▌·▐█▄█▌▐█•█▌▐█▄▄▌▐█▄▪▐█
-- ·▀▀▀▀  ▀▀▀  ▀▀▀▀  ▀▀▀  ▀▀▀ .▀  ▀ ▀▀▀  ▀▀▀▀ 
--
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "workspace"
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "scroll_move",
    scale = 0.9,
})

-- Fullscreen on at pinchin gesture with 4 fingers 
hl.gesture({ fingers = 4, direction = "pinchout", action = function ()
    hl.dispatch(hl.dsp.window.fullscreen({ action="set" })) 
end})

-- Fullscreen off at pinchin gesture with 4 fingers 
hl.gesture({ fingers = 4, direction = "pinchin", action = function ()
    hl.dispatch(hl.dsp.window.fullscreen({ action="unset" })) 
end})
