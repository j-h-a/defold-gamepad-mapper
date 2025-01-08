local M = {}

local function get_platform()
    local platform_map = {
        ["Darwin"] = "osx",
        ["Linux"] = "linux",
        ["Windows"] = "windows",
        ["HTML5"] = "web",
        ["Android"] = "android",
        ["iPhone OS"] = "ios",
    }
    return platform_map[sys.get_sys_info().system_name] or "unknown"
end

function M.new_driver(name, platform, dead_zone)
    local self = setmetatable({}, {__index = M})
    self.device = name
    self.platform = platform or get_platform()
    self.dead_zone = dead_zone or 0.1
    self.maps = {}
    return self
end

function M:to_string()
    local s = "driver\n{\n"
    s = s .. ('    device: "%s"\n'):format(self.device)
    s = s .. ('    platform: "%s"\n'):format(self.platform)
    s = s .. ('    dead_zone: %.2f\n'):format(self.dead_zone)
    for _, map in ipairs(self.maps) do
        s = s .. ("    map { input: %s type: %s index: %d "):format(map.input, map.type, map.index)

        if map.type == "GAMEPAD_TYPE_HAT" and map.hat_mask then
            s = s .. ("hat_mask: %d "):format(map.hat_mask)
        end

        for _, modifier in ipairs(map.modifiers) do
            s = s .. ("mod { mod: %s } "):format(modifier)
        end

        s = s .. "}\n"
    end

    s = s .. "}"
    return s
end

function M:add_map(map)
    table.insert(self.maps, map)
end

return M
