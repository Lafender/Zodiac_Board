extends Node
class_name Active_Map_Holder

export(NodePath) var map_container_path
export(Resource) var map_state

var map_container: Node


func _ready() -> void:
	map_container = get_node(map_container_path)
	map_state.connect("map_change_requested", self, "_on_map_change_requested")
	call_deferred("_on_map_change_requested", map_state.initial_map_scene_path)


func _on_map_change_requested(scene_path: String) -> void:
	Active_Map_Loader.load_scene(map_container, map_state, scene_path)
