extends Node
class_name Door_Trigger

# Listens to Movement's tile_collided. Colliding with a TileMap in the door group
# (FLOORS/DOORS/<Door_Name>) swaps the Map scene according to Door_Destinations.

export(NodePath) var movement_path
export(NodePath) var active_character_path
export(NodePath) var active_map_holder_path

var movement: Movement
var active_character: Node2D
var active_map_holder: Active_Map_Holder
var door_group_path := ""
var is_transition_pending := false


func _ready() -> void:
	movement = get_node(movement_path)
	active_character = get_node(active_character_path)
	active_map_holder = get_node(active_map_holder_path)
	door_group_path = Map_Layer_Config_Loader.load_config()["Door_Group_Path"]
	movement.connect("tile_collided", self, "_on_tile_collided")


func _on_tile_collided(tile_map: TileMap, _cell: Vector2) -> void:
	if is_transition_pending:
		return
	if not Map_Layer_Classifier.is_in_group(active_map_holder.map, tile_map, door_group_path):
		return
	var destination := Door_Destination_Lookup.find(active_map_holder.current_map_scene_path, tile_map.name)
	if destination.empty():
		return
	is_transition_pending = true
	call_deferred("_run_transition", destination) # never free physics bodies mid-collision


func _run_transition(destination: Dictionary) -> void:
	Map_Transition_Runner.run(active_character, active_map_holder, destination)
	is_transition_pending = false
