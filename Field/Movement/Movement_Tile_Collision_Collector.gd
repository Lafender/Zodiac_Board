extends Reference
class_name Movement_Tile_Collision_Collector

# After move_and_slide(): lists every TileMap the character slid against, with the tile cell hit.


static func collect(character: KinematicBody2D) -> Array:
	var hits := []
	for index in range(character.get_slide_count()):
		var collision := character.get_slide_collision(index)
		if collision.collider is TileMap:
			hits.append({"tile_map": collision.collider, "cell": _find_cell(collision)})
	return hits


static func _find_cell(collision: KinematicCollision2D) -> Vector2:
	var tile_map: TileMap = collision.collider
	var point_inside_tile := collision.position - collision.normal
	return tile_map.world_to_map(tile_map.to_local(point_inside_tile))
