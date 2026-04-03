local M = {}

function M.lualine()
    return "iceberg_light"
end

function M.palete(pal)
    pal.bg0 = "NONE"
    pal.bg1 = "#c1c2c7"
    pal.fg = "#343B58"
    pal.orange = "#bb7a61"
    pal.black = "#343B58"
    pal.red = "#c24242"
    pal.green = "#41a6b5"
    pal.yellow = "#8f5e15"
    pal.blue = "#2959aa"
    pal.magenta = "#7b43ba"
    pal.cyan = "#006c86"
    pal.white = "#707280"

    return pal
end

return M