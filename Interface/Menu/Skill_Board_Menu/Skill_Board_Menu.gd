extends Control
class_name Skill_Board_Menu


export(NodePath) onready var inventory_view = $HBoxContainer/Skill_Inventory_View
export(NodePath) onready var board_view = $HBoxContainer/VBoxContainer/PanelContainer/Skill_Board_View
export(NodePath) onready var inventory_info_view = $HBoxContainer/VBoxContainer/HBoxContainer/ScrollContainer/Inventory_Info_Panel
export(NodePath) onready var board_info_view = $HBoxContainer/VBoxContainer/HBoxContainer/ScrollContainer2/Board_Info_Panel

export(Resource) var inventory_selected_skill
export(Dictionary) var board_selected_slot = {
	"dpad_group": "NONE",
	"face_group": "NONE",
	"input_group": "NONE"
}


func _ready() -> void:
	pass
	# Connect inventory selection → info panel
#	inventory_view.chip_selection_changed.connect("_on_inventory_chip_selection_changed")
	# Connect board selection → info panel
#	board_view.slot_selection_changed.connect("_on_board_slot_selection_changed")
	# Equip request from board input
#	board_view.equip_requested.connect("_on_equip_requested")

func _on_inventory_chip_selection_changed(skill: Skill_Data) -> void:
	inventory_selected_skill = skill
	inventory_info_view._setup_panel(skill)

func _on_board_slot_selection_changed(slot: Dictionary) -> void:
	board_selected_slot = slot
	var skill = board_view.skill_board.get_skill(slot["dpad_group"], slot["face_group"], slot["input_group"])
	board_info_view._setup_panel(skill, slot)
	

func _on_equip_requested() -> void:
	var chip : Skill_Data = inventory_selected_skill
	if chip == null:
		return
	inventory_view.inventory._remove_item_from_inventory()
	inventory_view._update_inventory_view()
	inventory_info_view._setup_panel(chip)
	board_view.skill_board.set_skill(board_selected_slot["dpad_group"], board_selected_slot["face_group"], board_selected_slot["input_group"], chip)
	board_view.refresh_skill_board_view()
	board_info_view._setup_panel((chip), board_selected_slot)
	# Push to character data (board_view already writes into Skill_Board_Data)

func _on_deequip_requested() -> void:
	var chip = board_view.skill_board.get_skill(board_selected_slot["dpad_group"], board_selected_slot["face_group"], board_selected_slot["input_group"])
	inventory_view.inventory._add_item_to_inventory(chip)
	inventory_view._update_inventory_view()
	inventory_info_view._setup_panel()
	board_view.skill_board.remove_skill(board_selected_slot["dpad_group"], board_selected_slot["face_group"], board_selected_slot["input_group"])
	board_view.refresh_skill_board_view()
	board_info_view._setup_panel()
	pass
	
