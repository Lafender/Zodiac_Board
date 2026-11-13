extends Reference
class_name Mouse_Aim_Event_Handler

# Turns mouse aim on when the mouse moves and off when a gamepad is used.


static func handle(event: InputEvent, state: Mouse_Aim_State_Data, config: Movement_Config_Data) -> void:
	if event is InputEventMouseMotion:
		if event.relative.length() >= config.mouse_motion_threshold:
			state.active = true
	elif event is InputEventJoypadMotion:
		if abs(event.axis_value) >= config.joypad_release_threshold:
			state.active = false
	elif event is InputEventJoypadButton:
		state.active = false
