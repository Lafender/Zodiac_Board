extends Node
class_name Interaction

# Pressing Interact (A) while facing an interactive tile in range emits
# dialog_requested(action_id) or menu_requested(action_id). Connect your dialog/menu systems to those.

signal dialog_requested(action_id)
signal menu_requested(action_id)

export(NodePath) var active_character_path
export(NodePath) var active_map_holder_path
export(Resource) var character_data

var active_character: Node2D
var active_map_holder: Active_Map_Holder
var interactive_group_path := ""
var reach_pixels := 0.0
var probe_samples := 0


func _ready() -> void:
	active_character = get_node(active_character_path)
	active_map_holder = get_node(active_map_holder_path)
	var config := Map_Layer_Config_Loader.load_config()
	interactive_group_path = config["Interactive_Group_Path"]
	reach_pixels = float(config["Interact_Reach_Pixels"])
	probe_samples = int(config["Interact_Probe_Samples"])


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(Interaction_Action_Names.INTERACT):
		_try_interact()


func _try_interact() -> void:
	var facing := Facing_Direction_Accessor.read(character_data)
	var probe_points := Interact_Probe_Calculator.get_points(
		active_character.global_position, facing, reach_pixels, probe_samples
	)
	var tile_map := Interactive_Tile_Finder.find(active_map_holder.map, interactive_group_path, probe_points)
	if tile_map == null:
		return
	var action := Interactive_Action_Lookup.find(active_map_holder.current_map_scene_path, tile_map.name)
	Interaction_Dispatcher.dispatch(self, action)
