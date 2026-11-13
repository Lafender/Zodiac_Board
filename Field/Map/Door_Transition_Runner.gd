extends Reference
class_name Door_Transition_Runner

# Teleports the character first, then swaps the Map, so the camera snaps to the final position.


static func run(character: Node2D, state: Map_State_Data, destination: Door_Destination_Data) -> void:
	character.global_position = destination.spawn_position
	state.request_map_change(destination.destination_map_scene)
