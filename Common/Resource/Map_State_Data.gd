extends Resource
class_name Map_State_Data

# Mutable shared state + event hub for the current Map. Save as DATA.tres and link it
# into every node that needs it. Nodes talk to each other through this resource.

# warning-ignore:unused_signal
signal map_changed(new_map_root)
# warning-ignore:unused_signal
signal map_change_requested(scene_path)
# warning-ignore:unused_signal
signal tile_collided(tile_map, cell)

export(String, FILE, "*.tscn") var initial_map_scene_path := ""

var current_map_scene_path := ""
var map_root: Node
var map_bounds := Rect2()
var is_transition_pending := false


func request_map_change(scene_path: String) -> void:
	emit_signal("map_change_requested", scene_path)
