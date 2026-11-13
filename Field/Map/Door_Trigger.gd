extends Node
class_name Door_Trigger

export(NodePath) var active_character_path
export(Resource) var map_state
export(Resource) var map_layer_config
export(Resource) var door_destination_table

var active_character: Node2D


func _ready() -> void:
	active_character = get_node(active_character_path)
	map_state.connect("tile_collided", self, "_on_tile_collided")


func _on_tile_collided(tile_map: TileMap, _cell: Vector2) -> void:
	var destination := Door_Transition_Starter.find_destination(
		map_state, map_layer_config, door_destination_table, tile_map
	)
	if destination != null:
		call_deferred("_run_transition", destination) # never free physics bodies mid-collision


func _run_transition(destination: Door_Destination_Data) -> void:
	Door_Transition_Runner.run(active_character, map_state, destination)
