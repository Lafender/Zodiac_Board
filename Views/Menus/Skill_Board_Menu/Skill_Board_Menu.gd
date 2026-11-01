extends Control
class_name Skill_Board_Menu


export(Resource) var skill_board = load("res://Item/Equipment/Skill/BOARD/DATA.tres")

export(NodePath) onready var inventory_view = $HBoxContainer/Skill_Inventory_View
export(NodePath) onready var board_view = $HBoxContainer/VBoxContainer/PanelContainer/Skill_Board_View
export(NodePath) onready var inventory_info_view = $HBoxContainer/VBoxContainer/HBoxContainer/ScrollContainer/Inventory_Info_Panel
export(NodePath) onready var board_info_view = $HBoxContainer/VBoxContainer/HBoxContainer/ScrollContainer2/Board_Info_Panel




export(Resource) var inventory_selected_skill = null
export(Dictionary) var board_selected_slot = {
	"dpad_group": "NONE",
	"face_group": "NONE",
	"input_group": "NONE"
}


func _ready() -> void:
	_on_inventory_chip_selection_changed(inventory_selected_skill)
	_on_board_slot_selection_changed(board_selected_slot)
	pass
	# Connect inventory selection → info panel
#	inventory_view.chip_selection_changed.connect("_on_inventory_chip_selection_changed")
	# Connect board selection → info panel
#	board_view.slot_selection_changed.connect("_on_board_slot_selection_changed")
	# Equip request from board input
#	board_view.equip_requested.connect("_on_equip_requested")


func is_none_skill(skill: Resource) -> bool:
	if skill == null:
		return true
	return skill.resource_path.ends_with("_none.tres")



func _on_inventory_chip_selection_changed(skill: Skill_Data) -> void:
	inventory_selected_skill = skill
	inventory_info_view._setup_panel(skill)

func _on_board_slot_selection_changed(slot: Dictionary) -> void:
	board_selected_slot = slot
	var skill = skill_board.get_skill(slot["dpad_group"], slot["face_group"], slot["input_group"])
	board_info_view._setup_panel(skill, slot)
	

func _on_equip_requested() -> void:
	var new_chip : Skill_Data = inventory_selected_skill
	if new_chip == null:
		print("chip not equipped.")
		return

	# 1. Get the currently equipped chip in this slot
	var old_chip = board_view.skill_board.get_skill(
		board_selected_slot["dpad_group"],
		board_selected_slot["face_group"],
		board_selected_slot["input_group"]
	)

	# 2. If there is an old chip, return it to inventory
	if not is_none_skill(old_chip):
		inventory_view.inventory._add_item_to_inventory(old_chip)

	# 3. Remove the new chip from inventory
	inventory_view.inventory._remove_item_from_inventory(new_chip)

	# 4. Equip the new chip into the board
	board_view.add_skill_chip_panel(
		board_selected_slot["dpad_group"],
		board_selected_slot["face_group"],
		board_selected_slot["input_group"],
		new_chip
	)

	# 5. Refresh UI
	inventory_view._update_inventory_view()
	board_view.refresh_skill_board_view()
	inventory_info_view._setup_panel(new_chip)
	board_info_view._setup_panel(new_chip, board_selected_slot)

	# 6. Save board
	save_resource(board_view.skill_board, "res://Item/Equipment/Skill/BOARD/", "DATA")



func _on_deequip_requested() -> void:
	var chip = board_view.skill_board.get_skill(board_selected_slot["dpad_group"], board_selected_slot["face_group"], board_selected_slot["input_group"])
	inventory_view.inventory._add_item_to_inventory(chip)
	inventory_view._update_inventory_view()
	inventory_info_view._setup_panel(inventory_selected_skill)
	board_view.remove_skill_chip_panel(board_selected_slot["dpad_group"], board_selected_slot["face_group"], board_selected_slot["input_group"])
	save_resource(board_view.skill_board, "res://Item/Equipment/Skill/BOARD/", "DATA")
	board_view.refresh_skill_board_view()
	board_info_view._setup_panel(null, board_selected_slot)
	pass
	


static func save_resource(resource: Resource, folder_path: String, file_name: String = "", file_extension: String = ".tres") -> String:
	# Ensure folder ends with a slash
	if not folder_path.ends_with("/"):
		folder_path += "/"
	# Create folder if missing
	var dir := Directory.new()
	if not dir.dir_exists(folder_path):
		dir.make_dir_recursive(folder_path)
	# Auto‑generate filename if none provided
	if file_name == "":
		file_name = resource.resource_name
		if file_name == "":
			file_name = resource.get_class()
	file_name += file_extension
	var full_path := folder_path + file_name
	# Save resource
	var err := ResourceSaver.save(full_path, resource)
	if err != OK:
		push_error("Failed to save resource to: %s" % full_path)
		return ""
	return full_path
