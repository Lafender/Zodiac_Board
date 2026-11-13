extends Node
class_name Interaction

export(NodePath) var active_character_path
export(Resource) var character_data
export(Resource) var map_state
export(Resource) var map_layer_config

var active_character: Node2D


func _ready() -> void:
	active_character = get_node(active_character_path)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(Interaction_Action_Names.INTERACT):
		Interaction_Runner.run(active_character, character_data, map_state, map_layer_config)
