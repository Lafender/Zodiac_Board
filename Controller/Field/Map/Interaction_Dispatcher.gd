extends Reference
class_name Interaction_Dispatcher

# Turns an Interactive_Actions row into a signal on the emitter (the Interaction node).


static func dispatch(emitter: Object, action: Dictionary) -> void:
	if action.empty():
		return
	match str(action.get("Action_Type", "")):
		"Dialog":
			emitter.emit_signal("dialog_requested", action["Action_Id"])
		"Menu":
			emitter.emit_signal("menu_requested", action["Action_Id"])
		_:
			push_warning("Interaction_Dispatcher: unknown Action_Type " + str(action.get("Action_Type")))
