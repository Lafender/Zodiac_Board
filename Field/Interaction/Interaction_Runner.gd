extends Reference
class_name Interaction_Runner

# Finds the interactive TileMap in front of the character and calls interact() on its own script.


static func run(character: Node2D, character_data: Resource, state: Map_State_Data, config: Map_Layer_Config_Data) -> void:
	var facing := Facing_Direction_Accessor.read(character_data)
	var probe_points := Interact_Probe_Calculator.get_points(
		character.global_position, facing, config.interact_reach_pixels, config.interact_probe_samples
	)
	var tile_map := Interactive_Tile_Finder.find(state.map_root, config.interactive_group_path, probe_points)
	if tile_map != null and tile_map.has_method("interact"):
		tile_map.interact(character, character_data)
