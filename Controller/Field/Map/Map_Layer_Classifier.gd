extends Reference
class_name Map_Layer_Classifier

# True if the TileMap is a direct child of the group node at group_path (relative to the Map scene root).
# Example: group_path "FLOORS/DOORS" matches the TileMap "Door_Name" in FLOORS/DOORS/Door_Name.


static func is_in_group(map_root: Node, tile_map: Node, group_path: String) -> bool:
	if map_root == null or not map_root.is_a_parent_of(tile_map):
		return false
	return str(map_root.get_path_to(tile_map.get_parent())) == group_path
