extends PanelContainer
class_name Skill_Board_Slot_Panel

const skill_chip_panel = "res://Item/Equipment/Skill/CHIP/Skill_Chip_Panel/Skill_Chip_Panel.tscn"


export(int) var slot_x
export(int) var slot_y

export(String) var dpad_group = "NONE"
export(String) var face_group = "NONE"
export(String) var input_group = "NONE"
export(int) var index = -1

export(Vector2) var skill_chip_position = Vector2(14, 4)

var skill: Resource = load("res://Item/Equipment/Skill/LIST/Skill__none.tres")


func _ready():
	var button = find_node("Button", true, false)
	if button:
		button.add_to_group("slot_button")


func set_skill(new_skill: Resource) -> bool:
	if new_skill == null:
		skill = null
		return true
	else:
		skill = new_skill
		return true

func add_skill_panel(new_skill: Resource) -> void:
	var set_successful = set_skill(new_skill)
	if !set_successful:
		print("set_skill() unsuccessful.")
		return

	# 🧹 Remove all chip panels recursively
	_clear_chip_panels(self)

	# 🛑 Stop if null or none-skill
	if skill == null or skill.resource_path.ends_with("_none.tres"):
		return

	# 🧩 Add new chip
	var skill_chip_packed_scene = preload(skill_chip_panel)
	var new_skill_chip = skill_chip_packed_scene.instance()
	add_child(new_skill_chip)
	new_skill_chip.set_chip(skill)

	# 🧷 Chip under Button (child 0)
	move_child(new_skill_chip, 0)

	# 🧷 Button on top (last child)
	var button = find_node("Button", true, false)
	if button:
		move_child(button, get_child_count() - 1)

	new_skill_chip.rect_scale = Vector2(0.5, 0.5)
	new_skill_chip.rect_position = Vector2(16, 8)






func remove_skill_panel() -> void:
	set_skill(null)
	_clear_chip_panels(self)

	var button = find_node("Button", true, false)
	if button:
		move_child(button, get_child_count() - 1)





func get_slot():
	var slot: Dictionary
	slot["dpad_group"] = dpad_group
	slot["face_group"] = face_group
	slot["input_group"] = input_group
	slot["index"] = index
	return slot

func on_skill_board_menu_click() -> void:
	var slot = get_slot()
	var top_parent = get_tree().get_current_scene()
	if top_parent.name == "Skill_Board_Menu":
		top_parent._on_board_slot_selection_changed(slot)
#	var board_info_panel = top_parent.find_node("Board_Info_Panel")
#	board_info_panel._setup_panel(skill, slot)

func get_equipped_index() -> int:
	return index

func _clear_chip_panels(node: Node) -> void:
	for child in node.get_children():
		if child.name == "Button":
			continue
		# Recursively clear children first
		_clear_chip_panels(child)
		child.queue_free()

