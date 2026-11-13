extends Reference
class_name Input_Binding_Event_Factory


static func build(binding: Input_Binding_Data) -> InputEvent:
	if binding.event_type == Input_Binding_Data.KEY:
		var key_event := InputEventKey.new()
		key_event.scancode = binding.code
		return key_event
	if binding.event_type == Input_Binding_Data.JOY_AXIS:
		var axis_event := InputEventJoypadMotion.new()
		axis_event.axis = binding.code
		axis_event.axis_value = binding.axis_value
		return axis_event
	if binding.event_type == Input_Binding_Data.JOY_BUTTON:
		var button_event := InputEventJoypadButton.new()
		button_event.button_index = binding.code
		return button_event
	push_error("Input_Binding_Event_Factory: unknown event_type " + str(binding.event_type))
	return null
