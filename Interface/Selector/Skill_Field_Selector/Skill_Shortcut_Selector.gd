extends Control
class_name Skill_Shortcut_Selector

@export var dim_color := Color(0.2, 0.2, 0.2, 0.4)
@export var glow_color := Color(0.4, 1.0, 0.4, 0.9)

var current_corner := ""       # "up", "down", "left", "right"
var current_face_button := ""  # "A", "B", "X", "Y"

func _ready():
	_dim_all_tiles()

func update_selection_from_input():
	# D-Pad selects the major corner
	if Input.is_action_just_pressed("dpad_up"):
		current_corner = "up"
	elif Input.is_action_just_pressed("dpad_down"):
		current_corner = "down"
	elif Input.is_action_just_pressed("dpad_left"):
		current_corner = "left"
	elif Input.is_action_just_pressed("dpad_right"):
		current_corner = "right"

	# Face buttons select the sub-zone
	if Input.is_action_just_pressed("face_a"):
		current_face_button = "A"
	elif Input.is_action_just_pressed("face_b"):
		current_face_button = "B"
	elif Input.is_action_just_pressed("face_x"):
		current_face_button = "X"
	elif Input.is_action_just_pressed("face_y"):
		current_face_button = "Y"

	_apply_highlights()

func _dim_all_tiles():
	for tile in get_tree().get_nodes_in_group("selector_tile"):
		tile.self_modulate = dim_color

	for tile in get_tree().get_nodes_in_group("dpad_zone"):
		tile.self_modulate = dim_color

	for tile in get_tree().get_nodes_in_group("face_zone"):
		tile.self_modulate = dim_color

func _apply_highlights():
	_dim_all_tiles()

	# Highlight the selected D-Pad corner
	if current_corner != "":
		var corner_group := "corner_%s" % current_corner
		for tile in get_tree().get_nodes_in_group(corner_group):
			tile.self_modulate = glow_color

	# Highlight the selected face-button zone
	if current_face_button != "":
		var face_group := ""
		match current_face_button:
			"A": face_group = "face_down"
			"B": face_group = "face_right"
			"X": face_group = "face_left"
			"Y": face_group = "face_up"

		if face_group != "":
			for tile in get_tree().get_nodes_in_group(face_group):
				tile.self_modulate = glow_color

func apply_board_groups(board: Skill_Board_Data):
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

			var dpad: Array[String] = board.dpad_group[y][x]
			var face: Array[String] = board.face_group[y][x]

			tile.add_to_group("corner_%s" % dpad)

			match face:
				"A": tile.add_to_group("face_down")
				"B": tile.add_to_group("face_right")
				"X": tile.add_to_group("face_left")
				"Y": tile.add_to_group("face_up")
