extends Panel
class_name Skill_Board_Slot_Panel

export(String, FILE) var skill_panel_path := "res://Interface/Panel/Skill_Chip_Panel/Skill_Chip_Panel.tscn"

var slot_x: int
var slot_y: int
var skill: Skill_Data

func set_skill(new_skill: Skill_Data) -> void:
	if skill == null:
		print("No skill input to _set_skill() on Skill_Board_Slot_Panel.")
	else:
		for child in get_children():
			child.queue_free()
	skill = new_skill
	


func add_skill_panel(skill: Skill_Data) -> void: 
	set_skill(skill)
	if skill == null:
		print("No skill input to add to Skill_Chip_Panel on Skill_Board_Slot_Panel.")
	else:
		for child in get_children():
			child.queue_free()
	var chip_panel = load(skill_panel_path)
	var chip_panel_instance = chip_panel.instance()
	add_child(chip_panel_instance)
	chip_panel_instance.set_chip(skill)
