extends Resource
class_name Door_Destination_Data

export(String, FILE, "*.tscn") var source_map_scene := ""
export var door_name := ""
export(String, FILE, "*.tscn") var destination_map_scene := ""
export var spawn_position := Vector2.ZERO # global pixels in the destination map
