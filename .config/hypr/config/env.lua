-- ▄▄▄ . ▐ ▄  ▌ ▐·
-- ▀▄.▀·•█▌▐█▪█·█▌
-- ▐▀▀▪▄▐█▐▐▌▐█▐█•
-- ▐█▄▄▌██▐█▌ ███ 
--  ▀▀▀ ▀▀ █▪. ▀  
--
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

local HOME = os.getenv("HOME")

hl.env("EDITOR", "nvim")
hl.env("TERMINAL", "alacritty")
hl.env("BROWSER", "zen")
hl.env("SCRIPTS", HOME .. "/.local/bin")

-- GPU used for hyprland
-- seems like since 0.55 it uses inegrated gpu just fine by default 
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card2:/dev/dri/card1")

-- Disable mgpu buffer sync?? no clue what it does. 
-- hl.env("AQ_MGPU_NO_EXPLICIT", "1")

-- Disables realtime priority setting by Hyprland. I Allready have ananicy
hl.env("HYPRLAND_NO_RT", "1")

-- Wayland realted variables
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("DESKTOP_SESSION", "Hyprland")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XDG_SESSION_TYPE", "wayland")

-- Vulkan and nvidia related things
hl.env("VKD3D_FILTER_DEVICE_NAME", "NVIDIA") -- Force nvidia for VKD3D
hl.env("VK_ICD_FILENAMES", "/usr/share/vulkan/icd.d/nvidia_icd.json") -- Vulkan was unable to find my nvidia card, this one fixed it

-- User queue suppor for amd mesa dirvers.
-- https://www.phoronix.com/news/Mesa-25.0-AMDGPU-User-Queue
hl.env("AMD_USERQ", "1")

-- GTK4 apps use discrete gpu, this fixes it
-- I've put the same into /etc/environment 
hl.env("GSK_RENDERER", "opengl")

-- Nvidia cache related variables
hl.env("__GL_SHADER_DISK_CACHE", "1")                        -- Force caching. It might not cache shaders sometimes
hl.env("__GL_SHADER_DISK_CACHE_PATH", HOME .. "/.cache/nv")  -- Store shaders cache here
hl.env("__GL_SHADER_DISK_CACHE_SKIP_CLEANUP", "1")           -- Do not cleanup nvidia shaders cache

-- Qt related environment variables
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- What the hell is this?
-- Basically helps apps to figure out where to store:
local XDG_STATE_HOME  = HOME .. "/.local/state" -- App related state files
local XDG_DATA_HOME   = HOME .. "/.local/share" -- App related data 
local XDG_CONFIG_HOME = HOME .. "/.config"      -- App related configuration files
local XDG_CACHE_HOME  = HOME .. "/.cache"       -- App related cache files

-- Using these, your $HOME will have less weird directories and files
-- For more info see https://wiki.archlinux.org/title/XDG_Base_Directory
--                   https://wiki.archlinux.org/title/XDG_user_directories

-- Global XDG environment variables 
hl.env("XDG_STATE_HOME",  XDG_STATE_HOME)
hl.env("XDG_DATA_HOME",   XDG_DATA_HOME)
hl.env("XDG_CONFIG_HOME", XDG_CONFIG_HOME)
hl.env("XDG_CACHE_HOME",  XDG_CACHE_HOME)

hl.env("XDG_DESKTOP_DIR",     HOME .. "/wsp")                -- ~/Desktop to ~/wsp
hl.env("XDG_DOWNLOAD_DIR",    HOME .. "/dow")                -- ~/Downloads to ~/dow
hl.env("XDG_DOCUMENTS_DIR",   HOME .. "/doc")                -- ~/Documents to ~/doc
hl.env("XDG_PUBLICSHARE_DIR", HOME .. "/wsp/public")         -- ~/Public to ~/wsp/public
hl.env("XDG_MUSIC_DIR",       HOME .. "/med/music")          -- ~/Music to ~/med/music
hl.env("XDG_PICTURES_DIR",    HOME .. "/med/pictures")       -- ~/Pictures to ~/med/pictures
hl.env("XDG_VIDEOS_DIR",      HOME .. "/med/videos")         -- ~/Videos to ~/med/videos
hl.env("XDG_TEMPLATES_DIR",   XDG_DATA_HOME .. "/templates") -- ~/Templates to ~/.local/share/templates

-- Force misc apps use XDG base directories
hl.env("GNUPGHOME",             XDG_DATA_HOME   .. "/gnupg")
hl.env("MYSQL_HISTFILE",        XDG_DATA_HOME   .. "/mysql/history")
hl.env("CARGO_HOME",            XDG_DATA_HOME   .. "/rust-cargo")
hl.env("CUDA_CACHE_PATH",       XDG_CACHE_HOME  .. "/cuda")
hl.env("NPM_CONFIG_USERCONFIG", XDG_CONFIG_HOME .. "/npm/npmrc")
hl.env("WGETRC",                XDG_CONFIG_HOME .. "/wgetrc")
hl.env("DOCKER_CONFIG",         XDG_CONFIG_HOME .. "/docker")
hl.env("KEEPER_STORAGE_DIR",    XDG_STATE_HOME  .. "/keeper_storage")
hl.env("GOPATH",                XDG_DATA_HOME   .. "/go")
hl.env("GOMODCACHE",            XDG_CACHE_HOME  .. "/go/mod")
hl.env("PYTHON_HISTORY",        XDG_STATE_HOME  .. "/python_history")

hl.env("_JAVA_OPTIONS", "-Djava.util.prefs.userRoot="..XDG_CONFIG_HOME.."/java")
hl.env("GTK2_RC_FILES", string.format("%s/gtk-2.0/gtkrc:%s/gtk-2.0/gtkrc.mine", 
                                       XDG_CONFIG_HOME, XDG_CONFIG_HOME))

