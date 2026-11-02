extends Reference
class_name Movement_Input_Registrar

# Registers the movement actions at runtime from the generated JSON.
# Actions that already exist in Project Settings > Input Map are left untouched.

const BINDINGS_PATH := "res://Controller/input/Movement/data/Movement_Input_Bindings.json"


static func register_all() -> void:
	var bindings: Array = Json_File_Reader.read_dictionary(BINDINGS_PATH).get("Bindings", [])
	var pre_existing := _find_pre_existing_actions(bindings)
	for binding in bindings:
		if not pre_existing.has(binding["Action_Name"]):
			_register_binding(binding)


static func _find_pre_existing_actions(bindings: Array) -> Dictionary:
	var found := {}
	for binding in bindings:
		if InputMap.has_action(binding["Action_Name"]):
			found[binding["Action_Name"]] = true
	return found


static func _register_binding(binding: Dictionary) -> void:
	var action_name: String = binding["Action_Name"]
	if not InputMap.has_action(action_name):
		InputMap.add_action(action_name, float(binding["Dead_Zone"]))
	var event := Movement_Input_Event_Factory.build(binding)
	if event != null:
		InputMap.action_add_event(action_name, event)
