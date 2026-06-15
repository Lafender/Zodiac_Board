extends Skill_Board_View
class_name Skill_Shortcut_Selector



var current_corner := ""       # "up", "down", "left", "right"
var current_face_button := ""  # "A", "B", "X", "Y"


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
