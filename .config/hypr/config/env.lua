-- ▄▄▄ . ▐ ▄  ▌ ▐·
-- ▀▄.▀·•█▌▐█▪█·█▌
-- ▐▀▀▪▄▐█▐▐▌▐█▐█•
-- ▐█▄▄▌██▐█▌ ███ 
--  ▀▀▀ ▀▀ █▪. ▀  
--
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- GPU used for hyprland
-- seems like since 0.55 it uses inegrated gpu just fine by default 
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card2:/dev/dri/card1")

local HOME = os.getenv("HOME")

hl.env("EDITOR", "nvim")
hl.env("TERMINAL", "alacritty")
hl.env("BROWSER", "zen")
hl.env("SCRIPTS", HOME .. "/.local/bin")


-- Disables realtime priority setting by Hyprland. I Allready have ananicy
hl.env("HYPRLAND_NO_RT", "1")

-- Disable mgpu buffer sync?? no clue what it does. 
-- hl.env("AQ_MGPU_NO_EXPLICIT", "1")

-- Wayland realted variables
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("DESKTOP_SESSION", "Hyprland")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XDG_SESSION_TYPE", "wayland")

-- Setting nvidia as opengl provider
hl.env("VKD3D_FILTER_DEVICE_NAME", "NVIDIA")
hl.env("VK_ICD_FILENAMES", "/usrshare/vulkan/icd.d/nvidia_icd.json")

-- User queue suppor for amd mesa dirvers.
-- https://www.phoronix.com/news/Mesa-25.0-AMDGPU-User-Queue
hl.env("AMD_USERQ", "1")


-- GTK4 apps use discrete gpu, this fixes it
-- I've put the same into /etc/environment 
hl.env("GSK_RENDERER", "opengl")

-- Nvidia cache related variables
hl.env("__GL_SHADER_DISK_CACHE", "1")
hl.env("__GL_SHADER_DISK_CACHE_SKIP_CLEANUP", "1")
hl.env("__GL_SHADER_DISK_CACHE_PATH", HOME .."/.cache/nv")

-- Qt related environment variables
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Global XDG environment variables 
hl.env("XDG_STATE_HOME", HOME .. "/.local/state")
hl.env("XDG_DATA_HOME", HOME .. "/.local/share")
hl.env("XDG_CONFIG_HOME", HOME .. "/.config")
hl.env("XDG_CACHE_HOME", HOME .. "/.cache")

hl.env("XDG_DESKTOP_DIR", HOME .. "/wsp")
hl.env("XDG_DOWNLOAD_DIR", HOME .. "/dow")
hl.env("XDG_TEMPLATES_DIR", HOME .. "/.local/share/templates")
hl.env("XDG_PUBLICSHARE_DIR", HOME .. "/wsp/public")
hl.env("XDG_DOCUMENTS_DIR", HOME .. "/doc")

hl.env("XDG_MUSIC_DIR", HOME .. "/med/music")
hl.env("XDG_PICTURES_DIR", HOME .. "/med/pictures")
hl.env("XDG_VIDEOS_DIR", HOME .. "/med/videos")
hl.env("XDG_GAMES_DIR", HOME .. "/med/games")

hl.env("CUDA_CACHE_PATH", HOME .. "/.cache/cuda")
hl.env("GNUPGHOME", HOME .. "/.local/share/gnupg")