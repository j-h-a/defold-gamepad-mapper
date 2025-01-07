local M = {}

-- Defold standard messages
msg.ENABLE                 = hash("enable")
msg.DISABLE                = hash("disable")
msg.ACQUIRE_INPUT_FOCUS    = hash("acquire_input_focus")
msg.RELEASE_INPUT_FOCUS    = hash("release_input_focus")

-- Custom messages
msg.UPDATE_STATUS_TEXT     = hash("update_status_text")
msg.DEVICES_UPDATED        = hash("devices_updated")
msg.START_MAPPING          = hash("start_mapping")
msg.MAPPING_CANCELLED      = hash("mapping_cancelled")
msg.MAPPING_COMPLETED      = hash("mapping_completed")
msg.GAMEPAD_SELECTED       = hash("gamepad_selected")

-- URLs
M.main_gui = "main:/gui#main"
M.list_screen = "main:/list_screen#list"
M.mapper_screen = "main:/mapper_screen#mapper"

function M.init()
    M.main_gui = msg.url(M.main_gui)
    M.list_screen = msg.url(M.list_screen)
    M.mapper_screen = msg.url(M.mapper_screen)
end

return M
