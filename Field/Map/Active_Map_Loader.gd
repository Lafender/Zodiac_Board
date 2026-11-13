extends Reference
class_name Active_Map_Loader

# Swaps the Map scene under the container and publishes the new state on Map_State.


static func load_scene(container: Node, state: Map_State_Data, scene_path: String) -> void:
	var new_map := Map_Scene_Loader.instance_scene(scene_path)
	if new_map == null:
		state.is_transition_pending = false
		return
	_remove_current_map(container, state)
	container.add_child(new_map)
	state.map_root = new_map
	state.current_map_scene_path = scene_path
	state.map_bounds = Map_Bounds_Reader.read_global_bounds(new_map)
	state.is_transition_pending = false
	state.emit_signal("map_changed", new_map)


static func _remove_current_map(container: Node, state: Map_State_Data) -> void:
	if state.map_root != null and is_instance_valid(state.map_root):
		container.remove_child(state.map_root)
		state.map_root.queue_free()
	state.map_root = null
