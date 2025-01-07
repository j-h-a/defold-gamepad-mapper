local M = {}

M.all_inputs = {
    "ltrigger",
    "lshoulder",
    "lstick_up",
    "lstick_down",
    "lstick_left",
    "lstick_right",
    "lstick_click",
    "lpad_up",
    "lpad_down",
    "lpad_left",
    "lpad_right",
    "rtrigger",
    "rshoulder",
    "rpad_up",
    "rpad_down",
    "rpad_left",
    "rpad_right",
    "rstick_up",
    "rstick_down",
    "rstick_left",
    "rstick_right",
    "rstick_click",
    "back",
    "start",
    "guide",
}

local ITEM_SPACING = 46
local ITEM_OFFSET_0 = vmath.vector3(0, 0 * -ITEM_SPACING, 0)
local ITEM_OFFSET_1 = vmath.vector3(0, 1 * -ITEM_SPACING, 0)
local ITEM_OFFSET_2 = vmath.vector3(0, 2 * -ITEM_SPACING, 0)
local ITEM_OFFSET_3 = vmath.vector3(0, 3 * -ITEM_SPACING, 0)
local ITEM_OFFSET_4 = vmath.vector3(0, 4 * -ITEM_SPACING, 0)

local LEFT_START_POS = vmath.vector3(512, -22, 0)
local MIDDLE_START_POS = vmath.vector3(512, -22, 0)
local RIGHT_START_POS = vmath.vector3(512, -22, 0)

local LEFT_HOLD_POS = vmath.vector3(512, 210, 0)
local MIDDLE_HOLD_POS = vmath.vector3(512, 210, 0)
local RIGHT_HOLD_POS = vmath.vector3(512, 210, 0)

local LTOP_GROUP_POS = vmath.vector3(512 - 250, 650, 0)
local LSTICK_GROUP_POS = vmath.vector3(512 - 400, 550, 0)
local LPAD_GROUP_POS = vmath.vector3(512 - 270, 350, 0)

local RTOP_GROUP_POS = vmath.vector3(512 + 250, 650, 0)
local RPAD_GROUP_POS = vmath.vector3(512 + 400, 550, 0)
local RSTICK_GROUP_POS = vmath.vector3(512 + 270, 350 + ITEM_SPACING, 0)

local inputs_info = {
    lstick_up = {
        name = "Left Stick Up",
        prompt = "Move the left stick UP, and hold it there.",
        trigger_name = "GAMEPAD_LSTICK_UP",
        start_pos = LEFT_START_POS,
        hold_pos = LEFT_HOLD_POS,
        done_pos = LSTICK_GROUP_POS + ITEM_OFFSET_0,
    },
    lstick_down = {
        name = "Left Stick Down",
        prompt = "Move the left stick DOWN, and hold it there.",
        trigger_name = "GAMEPAD_LSTICK_DOWN",
        start_pos = LEFT_START_POS,
        hold_pos = LEFT_HOLD_POS,
        done_pos = LSTICK_GROUP_POS + ITEM_OFFSET_1,
    },
    lstick_left = {
        name = "Left Stick Left",
        prompt = "Move the left stick LEFT, and hold it there.",
        trigger_name = "GAMEPAD_LSTICK_LEFT",
        start_pos = LEFT_START_POS,
        hold_pos = LEFT_HOLD_POS,
        done_pos = LSTICK_GROUP_POS + ITEM_OFFSET_2,
    },
    lstick_right = {
        name = "Left Stick Right",
        prompt = "Move the left stick RIGHT, and hold it there.",
        trigger_name = "GAMEPAD_LSTICK_RIGHT",
        start_pos = LEFT_START_POS,
        hold_pos = LEFT_HOLD_POS,
        done_pos = LSTICK_GROUP_POS + ITEM_OFFSET_3,
    },
    lstick_click = {
        name = "Left Stick Click",
        prompt = "Depress to CLICK the left stick centrally (and hold).",
        trigger_name = "GAMEPAD_LSTICK_CLICK",
        start_pos = LEFT_START_POS,
        hold_pos = LEFT_HOLD_POS,
        done_pos = LSTICK_GROUP_POS + ITEM_OFFSET_4,
    },
    rstick_up = {
        name = "Right Stick Up",
        prompt = "Move the right stick UP, and hold it there.",
        trigger_name = "GAMEPAD_RSTICK_UP",
        start_pos = RIGHT_START_POS,
        hold_pos = RIGHT_HOLD_POS,
        done_pos = RSTICK_GROUP_POS + ITEM_OFFSET_0,
    },
    rstick_down = {
        name = "Right Stick Down",
        prompt = "Move the right stick DOWN, and hold it there.",
        trigger_name = "GAMEPAD_RSTICK_DOWN",
        start_pos = RIGHT_START_POS,
        hold_pos = RIGHT_HOLD_POS,
        done_pos = RSTICK_GROUP_POS + ITEM_OFFSET_1,
    },
    rstick_left = {
        name = "Right Stick Left",
        prompt = "Move the right stick LEFT, and hold it there.",
        trigger_name = "GAMEPAD_RSTICK_LEFT",
        start_pos = RIGHT_START_POS,
        hold_pos = RIGHT_HOLD_POS,
        done_pos = RSTICK_GROUP_POS + ITEM_OFFSET_2,
    },
    rstick_right = {
        name = "Right Stick Right",
        prompt = "Move the right stick RIGHT, and hold it there.",
        trigger_name = "GAMEPAD_RSTICK_RIGHT",
        start_pos = RIGHT_START_POS,
        hold_pos = RIGHT_HOLD_POS,
        done_pos = RSTICK_GROUP_POS + ITEM_OFFSET_3,
    },
    rstick_click = {
        name = "Right Stick Click",
        prompt = "Depress to CLICK the right stick centrally (and hold).",
        trigger_name = "GAMEPAD_RSTICK_CLICK",
        start_pos = RIGHT_START_POS,
        hold_pos = RIGHT_HOLD_POS,
        done_pos = RSTICK_GROUP_POS + ITEM_OFFSET_4,
    },
    lpad_up = {
        name = "L-PAD Up",
        prompt = "Press and hold UP on the left-side D-PAD.",
        trigger_name = "GAMEPAD_LPAD_UP",
        start_pos = LEFT_START_POS,
        hold_pos = LEFT_HOLD_POS,
        done_pos = LPAD_GROUP_POS + ITEM_OFFSET_0,
    },
    lpad_down = {
        name = "L-PAD Down",
        prompt = "Press and hold DOWN on the left-side D-PAD.",
        trigger_name = "GAMEPAD_LPAD_DOWN",
        start_pos = LEFT_START_POS,
        hold_pos = LEFT_HOLD_POS,
        done_pos = LPAD_GROUP_POS + ITEM_OFFSET_1,
    },
    lpad_left = {
        name = "L-PAD Left",
        prompt = "Press and hold LEFT on the left-side D-PAD.",
        trigger_name = "GAMEPAD_LPAD_LEFT",
        start_pos = LEFT_START_POS,
        hold_pos = LEFT_HOLD_POS,
        done_pos = LPAD_GROUP_POS + ITEM_OFFSET_2,
    },
    lpad_right = {
        name = "L-PAD Right",
        prompt = "Press and hold RIGHT on the left-side D-PAD.",
        trigger_name = "GAMEPAD_LPAD_RIGHT",
        start_pos = LEFT_START_POS,
        hold_pos = LEFT_HOLD_POS,
        done_pos = LPAD_GROUP_POS + ITEM_OFFSET_3,
    },
    rpad_up = {
        name = "R-PAD Up",
        prompt = "Using the four action buttons on the right-side,\npress and hold the TOP button.",
        trigger_name = "GAMEPAD_RPAD_UP",
        start_pos = RIGHT_START_POS,
        hold_pos = RIGHT_HOLD_POS,
        done_pos = RPAD_GROUP_POS + ITEM_OFFSET_0,
    },
    rpad_down = {
        name = "R-PAD Down",
        prompt = "Using the four action buttons on the right-side,\npress and hold the BOTTOM button.",
        trigger_name = "GAMEPAD_RPAD_DOWN",
        start_pos = RIGHT_START_POS,
        hold_pos = RIGHT_HOLD_POS,
        done_pos = RPAD_GROUP_POS + ITEM_OFFSET_1,
    },
    rpad_left = {
        name = "R-PAD Left",
        prompt = "Using the four action buttons on the right-side,\npress and hold the LEFT button.",
        trigger_name = "GAMEPAD_RPAD_LEFT",
        start_pos = RIGHT_START_POS,
        hold_pos = RIGHT_HOLD_POS,
        done_pos = RPAD_GROUP_POS + ITEM_OFFSET_2,
    },
    rpad_right = {
        name = "R-PAD Right",
        prompt = "Using the four action buttons on the right-side,\npress and hold the RIGHT button.",
        trigger_name = "GAMEPAD_RPAD_RIGHT",
        start_pos = RIGHT_START_POS,
        hold_pos = RIGHT_HOLD_POS,
        done_pos = RPAD_GROUP_POS + ITEM_OFFSET_3,
    },
    ltrigger = {
        name = "Left Trigger",
        prompt = "Press and hold the LEFT trigger\n(a.k.a. ZL or L2).",
        trigger_name = "GAMEPAD_LTRIGGER",
        start_pos = LEFT_START_POS,
        hold_pos = LEFT_HOLD_POS,
        done_pos = LTOP_GROUP_POS + ITEM_OFFSET_0,
    },
    lshoulder = {
        name = "Left Shoulder Button",
        prompt = "Press and hold the LEFT shoulder button\n(a.k.a. left-bumper or L1).",
        trigger_name = "GAMEPAD_LSHOULDER",
        start_pos = LEFT_START_POS,
        hold_pos = LEFT_HOLD_POS,
        done_pos = LTOP_GROUP_POS + ITEM_OFFSET_1,
    },
    rtrigger = {
        name = "Right Trigger",
        prompt = "Press and hold the RIGHT trigger\n(a.k.a. ZR or R2).",
        trigger_name = "GAMEPAD_RTRIGGER",
        start_pos = RIGHT_START_POS,
        hold_pos = RIGHT_HOLD_POS,
        done_pos = RTOP_GROUP_POS + ITEM_OFFSET_0,
    },
    rshoulder = {
        name = "Right Shoulder Button",
        prompt = "Press and hold the RIGHT sholder button\n(a.k.a. right-bumper or R1).",
        trigger_name = "GAMEPAD_RSHOULDER",
        start_pos = RIGHT_START_POS,
        hold_pos = RIGHT_HOLD_POS,
        done_pos = RTOP_GROUP_POS + ITEM_OFFSET_1,
    },
    back = {
        name = "Back Button",
        prompt = "Press and hold the back button\n(a.k.a. '-' or select).",
        trigger_name = "GAMEPAD_BACK",
        start_pos = MIDDLE_START_POS,
        hold_pos = MIDDLE_HOLD_POS,
        done_pos = vmath.vector3(512 - 115, 490, 0),
    },
    start = {
        name = "Start Button",
        prompt = "Press and hold the start button\n(a.k.a. '+' or menu).",
        trigger_name = "GAMEPAD_START",
        start_pos = MIDDLE_START_POS,
        hold_pos = MIDDLE_HOLD_POS,
        done_pos = vmath.vector3(512 + 115, 490, 0),
    },
    guide = {
        name = "Home/Guide Button",
        prompt = "Press and hold the home/guide button.",
        trigger_name = "GAMEPAD_GUIDE",
        start_pos = MIDDLE_START_POS,
        hold_pos = MIDDLE_HOLD_POS,
        done_pos = vmath.vector3(512, 440, 0),
    },
}

function M.get_input_info(input_id)
    return inputs_info[input_id]
end

return M
