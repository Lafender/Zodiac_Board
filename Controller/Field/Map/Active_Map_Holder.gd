extends Node
class_name Active_Map_Holder

# Single source of truth for "which Map Node is current".
# Call change_map() when the Active_Character changes floors or leaves a Map area.

signal map_changed(new_map)

export(NodePath) var initial_map_path

var map: TileMap


func get_map() -> TileMap:
	if map == null and not initial_map_path.is_empty():
		map = get_node(initial_map_path)
	return map


func change_map(new_map: TileMap) -> void:
	map = new_map
	emit_signal("map_changed", new_map)
