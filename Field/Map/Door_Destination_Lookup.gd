extends Reference
class_name Door_Destination_Lookup


static func find(table: Door_Destination_Table_Data, source_map_scene: String, door_name: String) -> Door_Destination_Data:
	for door in table.doors:
		if door.source_map_scene == source_map_scene and door.door_name == door_name:
			return door
	return null
