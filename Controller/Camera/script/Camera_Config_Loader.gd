extends Reference
class_name Camera_Config_Loader

const CONFIG_PATH := "res://Data/Camera/Camera_Config.json"
const DEFAULT_DEAD_ZONE_RATIO := 0.6666667


static func load_dead_zone_ratio() -> float:
	var data := Json_File_Reader.read_dictionary(CONFIG_PATH)
	return float(data.get("Dead_Zone_Ratio", DEFAULT_DEAD_ZONE_RATIO))
