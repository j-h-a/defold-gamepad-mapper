local M = {}

M.gamepads = {}

function M.add(index, name)
    M.gamepads[index] = name
end

function M.remove(index)
    M.gamepads[index] = nil
end

function M.is_connected(index)
    return M.gamepads[index] ~= nil
end

function M.get_name(index)
    return M.gamepads[index]
end

return M
