extends PanelContainer
class_name Skill_Board_View

export var dim_color := Color(0.2, 0.2, 0.2, 0.4)
export var glow_color := Color(0.4, 1.0, 0.4, 0.9)

export(Resource) var skill_board = Skill_Board_Data

export(String) var skill_board_size = "MAX"
var slots_array: Array = []

export var is_shortcut_selector: bool = false


export(float, 0, 1, 0.1) var skill_chip_scale = 0.5

export var selected_slot: Dictionary = {
	"dpad_group": "NONE",
	"face_group": "NONE",
	"input_group": "NONE"
}

export(NodePath) onready var checkerboard = $ScrollContainer/Checkerboard


const skill_chip_panel = "res://Action/Item/Equipment/Skill/CHIP/Skill_Chip_Panel/Skill_Chip_Panel.tscn"

func _ready():
	_dim_all_tiles()

func _set_up_array():
	skill_board._init()
	pass

func refresh_skill_board_view():
	for direction in skill_board.slots:
		for face_button in skill_board.slots[direction]:
			for skill_input in skill_board.slots[direction][face_button]:
				if skill_board.slots[direction][face_button][skill_input] != load("res://Action/Item/Equipment/Skill/LIST/Skill__none.tres"):
					add_skill_chip_panel(direction, face_button, skill_input, skill_board.slots[direction][face_button][skill_input])
				else:
					add_skill_chip_panel(direction, face_button, skill_input, load("res://Action/Item/Equipment/Skill/LIST/Skill__none.tres"))
	pass

func _dim_all_tiles():
	for tile in get_tree().get_nodes_in_group("selector_tile"):
		tile.self_modulate = dim_color

	for tile in get_tree().get_nodes_in_group("dpad_zone"):
		tile.self_modulate = dim_color

	for tile in get_tree().get_nodes_in_group("face_zone"):
		tile.self_modulate = dim_color


func set_selected_slot(dpad_group: String, face_group: String, input_group: String):
	selected_slot["dpad_group"] = dpad_group
	selected_slot["face_group"] = face_group
	selected_slot["input_group"] = input_group
	pass

func get_skill(dpad_group:String, face_group: String, input_group: String):
	skill_board.get_skill(dpad_group, face_group, input_group)
	pass

func add_skill_chip_panel(dpad_group: String, face_group: String, input_group: String, skill: Skill_Data):
	for slot in checkerboard.get_children():
		if slot.get_child_count < 0:
			if dpad_group == slot.dpad_group:
				if face_group == slot.face_group:
					if input_group == slot.input_group:
						slot.add_skill_panel()

	
