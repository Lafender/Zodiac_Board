extends Reference
class_name Map_Bounds_Reader

# Returns the combined used area of every TileMap in a Map scene, in global coordinates.
# Assumes standard top-down TileMaps (not isometric).


static func read_global_bounds(map_root: Node) -> Rect2:
	if map_root == null:
		return Rect2()
	var bounds := Rect2()
	var has_bounds := false
	for tile_map in Tile_Map_Collector.collect(map_root):
		var tile_map_bounds := _read_tile_map_bounds(tile_map)
		if tile_map_bounds.has_no_area():
			continue
		bounds = tile_map_bounds if not has_bounds else bounds.merge(tile_map_bounds)
		has_bounds = true
	return bounds


static func _read_tile_map_bounds(tile_map: TileMap) -> Rect2:
	var used_rect := tile_map.get_used_rect()
	var top_left := tile_map.to_global(tile_map.map_to_world(used_rect.position))
	var size := used_rect.size * tile_map.cell_size * tile_map.global_scale
	return Rect2(top_left, size)
