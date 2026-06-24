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

var skill: Resource = load("res://Action/Item/Equipment/Skill/LIST/Skill__none.tres")

func set_skill(new_skill: Resource) -> bool:
	if new_skill == null:
		skill = load("res://Action/Item/Equipment/Skill/LIST/_none.tres")
		return true
	else:
		skill = new_skill
		return true



func add_skill_panel(new_skill: Resource) -> void: 
	var set_successful = set_skill(new_skill)
	if !set_successful:
		print("set_skill() unsuccessful.")
	else:
		var skill_chip_panel_instance = find_node("Skill_Chip_Panel")
		if skill_chip_panel_instance != null:
			skill_chip_panel_instance.queue_free()
		if skill == load("res://Action/Item/Equipment/Skill/LIST/_none.tres"):
			return
		var skill_chip_packed_scene = preload(skill_chip_panel)
		var new_skill_chip = skill_chip_packed_scene.instance()
		add_child(new_skill_chip)
		new_skill_chip.set_skill(skill)
		move_child(new_skill_chip, 0)
		new_skill_chip.rect_scale = Vector2(0.5, 0.5)
		new_skill_chip.rect_position = Vector2(16, 8)

func set_selected_slot() -> Dictionary:
	var slot: Dictionary
	slot["dpad_group"] = dpad_group
	slot["face_group"] = face_group
	slot["input_group"] = input_group
	slot["index"] = index
	return slot

func get_equipped_index() -> int:
	return index
