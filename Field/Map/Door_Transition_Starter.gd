extends Reference
class_name Door_Transition_Starter

# Decides whether a tile collision is a door with a filled-in destination.
# Marks the transition as pending so one door touch only triggers once.


static func find_destination(state: Map_State_Data, config: Map_Layer_Config_Data, table: Door_Destination_Table_Data, tile_map: TileMap) -> Door_Destination_Data:
	if state.is_transition_pending:
		return null
	if not Map_Layer_Classifier.is_in_group(state.map_root, tile_map, config.door_group_path):
		return null
	var destination := Door_Destination_Lookup.find(table, state.current_map_scene_path, tile_map.name)
	if destination == null or destination.destination_map_scene == "":
		return null
	state.is_transition_pending = true
	return destination
