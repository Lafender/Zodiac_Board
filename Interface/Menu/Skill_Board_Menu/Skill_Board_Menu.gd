extends Control
class_name Skill_Board_Menu


export(NodePath) onready var inventory_view = $HBoxContainer/Skill_Inventory_View
export(NodePath) onready var board_view = $HBoxContainer/VBoxContainer/Skill_Board_View
export(NodePath) onready var inventory_info_view = $HBoxContainer/VBoxContainer/Skill_Info_View
export(NodePath) onready var board_info_view = $HBoxContainer

export(Resource) var inventory_selected_skill
export(Dictionary) var board_selected_slot = {
	"dpad_group": "NONE",
	"face_group": "NONE",
	"input_group": "NONE"
}


func _ready() -> void:
	

	# Connect inventory selection → info panel
	inventory_view.chip_selection_changed.connect("_on_inventory_chip_selection_changed")
	# Connect board selection → info panel
	board_view.slot_selection_changed.connect("_on_board_slot_selection_changed")
	# Equip request from board input
	board_view.equip_requested.connect("_on_equip_requested")

func _on_inventory_chip_selection_changed(skill: Skill_Data) -> void:
	inventory_info_view._setup_panel(skill)

func _on_board_slot_selection_changed(slot: Dictionary) -> void:
	var new_dpad_group = slot["dpad_group"]
	var new_face_group = slot["face_group"]
	var new_input_group = slot["input_group"]
	var skill = board_view.skill_board.get_skill(new_dpad_group, new_face_group, new_input_group)
	board_info_view._setup_panel(skill)
	board_selected_slot = slot

func _on_equip_requested() -> void:
	var chip : Skill_Data = inventory_view.get_selected_chip()
	if chip == null:
		return
	board_view.equip_chip(chip)
	inventory_view.mark_chip_equipped(chip)
	# Push to character data (board_view already writes into Skill_Board_Data)
