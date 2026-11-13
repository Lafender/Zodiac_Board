extends Reference
class_name Movement_Tile_Collision_Reporter


static func report(character: KinematicBody2D, state: Map_State_Data) -> void:
	for hit in Movement_Tile_Collision_Collector.collect(character):
		state.emit_signal("tile_collided", hit["tile_map"], hit["cell"])
