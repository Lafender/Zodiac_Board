extends Reference
class_name Map_Layer_Config_Loader

const CONFIG_PATH := "res://Data/Map/Map_Layer_Config.json"
const DEFAULTS := {
	"Door_Group_Path": "FLOORS/DOORS",
	"Interactive_Group_Path": "FLOOR/INTERACTIVE",
	"Interact_Reach_Pixels": 24.0,
	"Interact_Probe_Samples": 3,
}


static func load_config() -> Dictionary:
	var config := DEFAULTS.duplicate()
	config.merge(Json_File_Reader.read_dictionary(CONFIG_PATH), true)
	return config
