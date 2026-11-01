extends Reference
class_name Movement_Config_Loader

const CONFIG_PATH := "res://Data/Movement/Movement_Config.json"
const DEFAULT_MOVE_SPEED := 120.0


static func load_move_speed() -> float:
	var data := Json_File_Reader.read_dictionary(CONFIG_PATH)
	return float(data.get("Move_Speed", DEFAULT_MOVE_SPEED))
