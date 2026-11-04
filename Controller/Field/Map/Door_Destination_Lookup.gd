extends Reference
class_name Door_Destination_Lookup

const TABLE_PATH := "res://Data/Map/Door_Destinations.json"


static func find(source_map_scene: String, door_name: String) -> Dictionary:
	var rows: Array = Json_File_Reader.read_dictionary(TABLE_PATH).get("Doors", [])
	return Table_Row_Finder.find_row(rows, {
		"Source_Map_Scene": source_map_scene,
		"Door_Name": door_name,
	})
