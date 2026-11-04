extends Reference
class_name Interactive_Tile_Finder

# Returns the first TileMap in the interactive group that has a tile at one of the probe points.


static func find(map_root: Node, group_path: String, probe_points: Array) -> TileMap:
	if map_root == null:
		return null
	var group := map_root.get_node_or_null(group_path)
	if group == null:
		return null
	for point in probe_points:
		for child in group.get_children():
			if child is TileMap and _has_tile_at(child, point):
				return child
	return null


static func _has_tile_at(tile_map: TileMap, world_point: Vector2) -> bool:
	var cell := tile_map.world_to_map(tile_map.to_local(world_point))
	return tile_map.get_cellv(cell) != TileMap.INVALID_CELL
