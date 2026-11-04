extends Reference
class_name Map_Transition_Runner

# Teleports the character first, then swaps the Map, so the camera snaps to the final position.


static func run(character: Node2D, holder: Active_Map_Holder, destination: Dictionary) -> void:
	character.global_position = Vector2(
		float(destination["Spawn_X"]),
		float(destination["Spawn_Y"])
	)
	holder.change_map_scene(str(destination["Destination_Map_Scene"]))
