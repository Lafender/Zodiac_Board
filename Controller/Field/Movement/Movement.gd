extends Node
class_name Movement

signal tile_collided(tile_map, cell)

export(NodePath) var active_character_path
export(NodePath) var active_map_holder_path
export(Resource) var character_data

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


func _physics_process(_delta: float) -> void:
	var move_direction := Movement_Input_Reader.read_direction()
	_update_facing(move_direction, Aim_Input_Reader.read_direction())
	var velocity := Movement_Velocity_Calculator.calculate(move_direction, move_speed)
	active_character.move_and_slide(velocity)
	_report_tile_collisions()
	active_character.global_position = Movement_Bounds_Clamper.clamp_position(
		active_character.global_position, map_bounds
	)


func _update_facing(move_direction: Vector2, aim_direction: Vector2) -> void:
	var current_facing := Facing_Direction_Accessor.read(character_data)
	var new_facing := Facing_Direction_Calculator.calculate(current_facing, move_direction, aim_direction)
	if new_facing != current_facing:
		Facing_Direction_Accessor.write(character_data, new_facing)


func _report_tile_collisions() -> void:
	for hit in Movement_Tile_Collision_Collector.collect(active_character):
		emit_signal("tile_collided", hit["tile_map"], hit["cell"])


func _on_map_changed(new_map: Node) -> void:
	map_bounds = Map_Bounds_Reader.read_global_bounds(new_map)
