extends Camera2D
class_name Camera_Follow

export(NodePath) var active_character_path
export(Resource) var camera_config
export(Resource) var map_state

var active_character: Node2D


func _ready() -> void:
	active_character = get_node(active_character_path)
	Camera_Settings_Applier.apply(self)
	map_state.connect("map_changed", self, "_on_map_changed")


func _physics_process(_delta: float) -> void:
	global_position = Camera_Follow_Solver.follow(self, active_character.global_position, camera_config, map_state)


func _on_map_changed(_new_map_root: Node) -> void:
	global_position = Camera_Follow_Solver.snap(self, active_character.global_position, map_state)
