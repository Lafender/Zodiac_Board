extends Reference
class_name Interactive_Action_Lookup

const TABLE_PATH := "res://Data/Map/Interactive_Actions.json"


static func find(map_scene: String, interactive_tile: String) -> Dictionary:
	var rows: Array = Json_File_Reader.read_dictionary(TABLE_PATH).get("Interactives", [])
	return Table_Row_Finder.find_row(rows, {
		"Map_Scene": map_scene,
		"Interactive_Tile": interactive_tile,
	})
