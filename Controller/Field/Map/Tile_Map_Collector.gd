extends Reference
class_name Tile_Map_Collector

# Recursively collects every TileMap under (and including) a node.


static func collect(root: Node) -> Array:
	var tile_maps := []
	if root is TileMap:
		tile_maps.append(root)
	for child in root.get_children():
		tile_maps += collect(child)
	return tile_maps
