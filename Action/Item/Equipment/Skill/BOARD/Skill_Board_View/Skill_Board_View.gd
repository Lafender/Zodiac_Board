extends Panel
class_name Skill_Board_View

export var dim_color := Color(0.2, 0.2, 0.2, 0.4)
export var glow_color := Color(0.4, 1.0, 0.4, 0.9)

export var is_shortcut_selector: bool = false

func _ready():
	_dim_all_tiles()


func _dim_all_tiles():
	for tile in get_tree().get_nodes_in_group("selector_tile"):
		tile.self_modulate = dim_color

	for tile in get_tree().get_nodes_in_group("dpad_zone"):
		tile.self_modulate = dim_color

	for tile in get_tree().get_nodes_in_group("face_zone"):
		tile.self_modulate = dim_color



func apply_board_groups(board: Resource):
	# Clear old groups
	for tile in get_tree().get_nodes_in_group("selector_tile"):
		for g in ["corner_up","corner_down","corner_left","corner_right",
				  "face_up","face_down","face_left","face_right"]:
			tile.remove_from_group(g)

	# Reassign based on board data
	for y in board.height:
		for x in board.width:
			var tile_name := "Tile_%d" % [x + y * 8]
			var tile := $Checkerboard.get_node(tile_name)
			var dpad  = board.dpad_group[y][x]
			var face = board.face_group[y][x]
			tile.add_to_group("corner_%s" % dpad)
			match face:
				"A": tile.add_to_group("face_down")
				"B": tile.add_to_group("face_right")
				"X": tile.add_to_group("face_left")
				"Y": tile.add_to_group("face_up")
