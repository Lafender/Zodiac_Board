extends Node
class_name Movement

export(NodePath) var active_character_path
export(Resource) var character_data
export(Resource) var movement_config
export(Resource) var input_binding_table
export(Resource) var map_state

var active_character: KinematicBody2D
var mouse_aim_state := Mouse_Aim_State_Data.new()


func _ready() -> void:
	active_character = get_node(active_character_path)
	Input_Binding_Registrar.register_all(input_binding_table)
	Facing_Direction_Accessor.warn_if_missing(character_data)


func _input(event: InputEvent) -> void:
	Mouse_Aim_Event_Handler.handle(event, mouse_aim_state, movement_config)


func _physics_process(_delta: float) -> void:
	Movement_Step.run(active_character, character_data, movement_config, map_state, mouse_aim_state)
