extends Node
class_name Movement

export(NodePath) var active_character_path
export(NodePath) var active_map_holder_path

var active_character: KinematicBody2D
var active_map_holder: Active_Map_Holder
var move_speed := 0.0
var map_bounds := Rect2()


func _ready() -> void:
	active_character = get_node(active_character_path)
	active_map_holder = get_node(active_map_holder_path)
	Movement_Input_Registrar.register_all()
	move_speed = Movement_Config_Loader.load_move_speed()
	active_map_holder.connect("map_changed", self, "_on_map_changed")
	_on_map_changed(active_map_holder.get_map())


func _physics_process(_delta: float) -> void:
	var direction := Movement_Input_Reader.read_direction()
	var velocity := Movement_Velocity_Calculator.calculate(direction, move_speed)
	active_character.move_and_slide(velocity)
	active_character.global_position = Movement_Bounds_Clamper.clamp_position(
		active_character.global_position, map_bounds
	)


func _on_map_changed(new_map: TileMap) -> void:
	map_bounds = Map_Bounds_Reader.read_global_bounds(new_map)
