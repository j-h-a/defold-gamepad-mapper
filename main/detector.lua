local M = {}

local DETECT_THRESHOLD = 0.2 -- Above this value counts as input.

M.INPUT_TYPE_HAT = "GAMEPAD_TYPE_HAT"
M.INPUT_TYPE_AXIS = "GAMEPAD_TYPE_AXIS"
M.INPUT_TYPE_BUTTON = "GAMEPAD_TYPE_BUTTON"

M.MODIFIER_NEGATE = "GAMEPAD_MODIFIER_NEGATE"
M.MODIFIER_CLAMP = "GAMEPAD_MODIFIER_CLAMP"
M.MODIFIER_SCALE = "GAMEPAD_MODIFIER_SCALE"

function M.new()
    local self = setmetatable({}, {__index = M})
    local timenow = socket.gettime()
    self.none = {
        detected = false,
        reset_time = timenow,
        duration = 0,
    }
    self.single = {
        detected = false,
        reset_time = timenow,
        duration = 0,
    }
    return self
end

local function calculate_and_add_modifiers(data)
    data.modifiers = {}

    if data.value < 0 then
        table.insert(data.modifiers, M.MODIFIER_NEGATE)
    end

    if data.type == M.INPUT_TYPE_AXIS then
        if math.abs(data.value) > 1.5 then
            table.insert(data.modifiers, M.MODIFIER_SCALE)
        else
            table.insert(data.modifiers, M.MODIFIER_CLAMP)
        end
    end

    if data.type == M.INPUT_TYPE_HAT then
        data.hat_mask = data.value
    end

    return data
end

function M:update_raw_gamepad_data(raw_data)
    local axis_count = 0
    local buttons_count = 0
    local hats_count = 0
    local timenow = socket.gettime()
    local detected_data = {}

    for i, value in ipairs(raw_data.gamepad_axis) do
        if math.abs(value) > DETECT_THRESHOLD then
            axis_count = axis_count + 1
            detected_data.type = M.INPUT_TYPE_AXIS
            detected_data.index = i - 1
            detected_data.value = value
        end
    end

    for i, value in ipairs(raw_data.gamepad_buttons) do
        if math.abs(value) > DETECT_THRESHOLD then
            buttons_count = buttons_count + 1
            detected_data.type = M.INPUT_TYPE_BUTTON
            detected_data.index = i - 1
            detected_data.value = value
        end
    end

    for i, value in ipairs(raw_data.gamepad_hats) do
        if math.abs(value) > DETECT_THRESHOLD then
            hats_count = hats_count + 1
            detected_data.type = M.INPUT_TYPE_HAT
            detected_data.index = i - 1
            detected_data.value = value
        end
    end

    -- Hats seem to be remapped buttons, so when a hat is present a button will also be present.
    -- That is also why hats are counted last - so that the detected_data will be the hat.
    if hats_count == buttons_count then
        buttons_count = buttons_count - hats_count
    end
    local input_count = axis_count + buttons_count + hats_count

    -- Detect no inputs
    if input_count == 0 then
        if not self.none.detected then
            self.none.detected = true
            self.none.reset_time = timenow
        end
        self.none.duration = timenow - self.none.reset_time
    else
        self.none.detected = false
        self.none.duration = 0
    end

    -- Detect single input
    if input_count == 1 then
        if not self.single.detected then
            self.single.detected = true
            self.single.reset_time = timenow
        end
        self.single.duration = timenow - self.single.reset_time
        self.single.data = calculate_and_add_modifiers(detected_data)
    else
        self.single.detected = false
        self.single.duration = 0
    end
end

function M:no_input_progress(duration)
    return self.none.detected and vmath.clamp(self.none.duration / duration, 0, 1) or 0
end

function M:single_input_progress(duration)
    return self.single.detected and vmath.clamp(self.single.duration / duration, 0, 1) or 0
end

function M:get_single_data()
    return self.single.detected and self.single.data or nil
end

return M
