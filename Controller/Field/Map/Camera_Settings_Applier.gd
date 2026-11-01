extends Reference
class_name Map_Bounds_Reader

# Returns the used area of a TileMap as a Rect2 in global (world) coordinates.
# Assumes a standard top-down TileMap (not isometric).


static func read_global_bounds(map: TileMap) -> Rect2:
	if map == null:
		return Rect2()
	var used_rect := map.get_used_rect()
	var top_left := map.to_global(map.map_to_world(used_rect.position))
	var size := used_rect.size * map.cell_size * map.global_scale
	return Rect2(top_left, size)
