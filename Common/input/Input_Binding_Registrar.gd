extends Reference
class_name Input_Binding_Registrar

# Registers every action in the table at runtime. No Input Map setup in the editor is needed.
# Actions that already exist in Project Settings > Input Map are left untouched.


static func register_all(table: Input_Binding_Table_Data) -> void:
	if table == null:
		push_error("Input_Binding_Registrar: no Input_Binding_Table assigned")
		return
	var pre_existing := _find_pre_existing_actions(table)
	for binding in table.bindings:
		if not pre_existing.has(binding.action_name):
			_register_binding(binding)


static func _find_pre_existing_actions(table: Input_Binding_Table_Data) -> Dictionary:
	var found := {}
	for binding in table.bindings:
		if InputMap.has_action(binding.action_name):
			found[binding.action_name] = true
	return found


static func _register_binding(binding: Input_Binding_Data) -> void:
	if not InputMap.has_action(binding.action_name):
		InputMap.add_action(binding.action_name, binding.dead_zone)
	var event := Input_Binding_Event_Factory.build(binding)
	if event != null:
		InputMap.action_add_event(binding.action_name, event)
