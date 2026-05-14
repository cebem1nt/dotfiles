-- • ▌ ▄ ·.        ▐ ▄  ▪  ▄▄▄▄▄      ▄▄▄  .▄▄ · 
-- ·██ ▐███▪▪     •█▌▐█ ██ •██  ▪     ▀▄ █·▐█ ▀. 
-- ▐█ ▌▐▌▐█· ▄█▀▄ ▐█▐▐▌ ▐█· ▐█.▪ ▄█▀▄ ▐▀▀▄ ▄▀▀▀█▄
-- ██ ██▌▐█▌▐█▌.▐▌██▐█▌ ▐█▌ ▐█▌·▐█▌.▐▌▐█•█▌▐█▄▪▐█
-- ▀▀  █▪▀▀▀ ▀█▄▀▪▀▀ █▪ ▀▀▀ ▀▀▀  ▀█▄▀▪.▀  ▀ ▀▀▀▀ 
--
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output   = "eDP-2",
    mode     = "1920x1080@144",
    position = "0x0",
    scale    = "1",
})

-- Mirror eDP-2 to all plugged monitors
hl.monitor({  
    output   = "",  
    mode     = "preferred",  
    position = "auto",  
    scale    = "1",  
    mirror   = "eDP-2"  
})