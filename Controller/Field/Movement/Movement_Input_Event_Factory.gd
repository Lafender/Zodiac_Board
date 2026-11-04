extends Reference
class_name Movement_Input_Event_Factory


static func build(binding: Dictionary) -> InputEvent:
	match binding["Event_Type"]:
		"Key":
			var key_event := InputEventKey.new()
			key_event.scancode = int(binding["Code"])
			return key_event
		"Joy_Axis":
			var axis_event := InputEventJoypadMotion.new()
			axis_event.axis = int(binding["Code"])
			axis_event.axis_value = float(binding["Axis_Value"])
			return axis_event
		"Joy_Button":
			var button_event := InputEventJoypadButton.new()
			button_event.button_index = int(binding["Code"])
			return button_event
	push_error("Movement_Input_Event_Factory: unknown Event_Type " + str(binding["Event_Type"]))
	return null
