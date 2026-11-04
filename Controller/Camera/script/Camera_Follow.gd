extends Camera2D
class_name Camera_Follow

export(NodePath) var active_character_path
export(NodePath) var active_map_holder_path

var active_character: Node2D
var active_map_holder: Active_Map_Holder
var dead_zone_ratio := 0.0
var map_bounds := Rect2()


func _ready() -> void:
	active_character = get_node(active_character_path)
	active_map_holder = get_node(active_map_holder_path)
	dead_zone_ratio = Camera_Config_Loader.load_dead_zone_ratio()
	Camera_Settings_Applier.apply(self)
	active_map_holder.connect("map_changed", self, "_on_map_changed")


func _physics_process(_delta: float) -> void:
	var half_extents := Camera_Dead_Zone_Calculator.get_half_extents(
		get_viewport_rect().size, zoom, dead_zone_ratio
	)
	var offset_from_center := active_character.global_position - global_position
	var push := Camera_Push_Calculator.get_push(offset_from_center, half_extents)
	_move_to(global_position + push)


func _on_map_changed(new_map: Node) -> void:
	map_bounds = Map_Bounds_Reader.read_global_bounds(new_map)
	_move_to(active_character.global_position) # snap to the character, clamped to the new Map


func _move_to(target: Vector2) -> void:
	var view_size := get_viewport_rect().size * zoom
	global_position = Camera_Bounds_Clamper.clamp_center(target, view_size, map_bounds)
