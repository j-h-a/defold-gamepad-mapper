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

local output_order = {
    "GAMEPAD_LSTICK_LEFT",
    "GAMEPAD_LSTICK_RIGHT",
    "GAMEPAD_LSTICK_DOWN",
    "GAMEPAD_LSTICK_UP",
    "GAMEPAD_LSTICK_CLICK",
    "GAMEPAD_RSTICK_LEFT",
    "GAMEPAD_RSTICK_RIGHT",
    "GAMEPAD_RSTICK_DOWN",
    "GAMEPAD_RSTICK_UP",
    "GAMEPAD_RSTICK_CLICK",
    "GAMEPAD_LPAD_LEFT",
    "GAMEPAD_LPAD_RIGHT",
    "GAMEPAD_LPAD_DOWN",
    "GAMEPAD_LPAD_UP",
    "GAMEPAD_RPAD_LEFT",
    "GAMEPAD_RPAD_RIGHT",
    "GAMEPAD_RPAD_DOWN",
    "GAMEPAD_RPAD_UP",
    "GAMEPAD_LTRIGGER",
    "GAMEPAD_LSHOULDER",
    "GAMEPAD_RTRIGGER",
    "GAMEPAD_RSHOULDER",
    "GAMEPAD_START",
    "GAMEPAD_BACK",
    "GAMEPAD_GUIDE",
    "GAMEPAD_RAW",
}

function M.new_driver(name, platform, dead_zone)
    local self = setmetatable({}, {__index = M})
    self.device = name
    self.platform = platform or get_platform()
    self.dead_zone = dead_zone or 0.1
    self.maps = {
        ["GAMEPAD_RAW"] = {
            input = "GAMEPAD_RAW",
            type = "GAMEPAD_TYPE_AXIS",
            index = 0,
            modifiers = {},
        }
    }
    return self
end

local function map_to_string(map)
    local s = ("    map { input: %s type: %s index: %d "):format(map.input, map.type, map.index)

    if map.type == "GAMEPAD_TYPE_HAT" and map.hat_mask then
        s = s .. ("hat_mask: %d "):format(map.hat_mask)
    end

    for _, modifier in ipairs(map.modifiers) do
        s = s .. ("mod { mod: %s } "):format(modifier)
    end

    s = s .. "}\n"
    return s
end

function M:to_string()
    local s = "driver\n{\n"
    s = s .. ('    device: "%s"\n'):format(self.device)
    s = s .. ('    platform: "%s"\n'):format(self.platform)
    s = s .. ('    dead_zone: %.2f\n'):format(self.dead_zone)

    for _, input in ipairs(output_order) do
        local map = self.maps[input]
        if map then
            s = s .. map_to_string(map)
        end
    end

    s = s .. "}"
    return s
end

function M:add_map(map)
    self.maps[map.input] = map
end

return M
