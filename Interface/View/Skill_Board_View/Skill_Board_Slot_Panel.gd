extends Panel
class_name Skill_Board_Slot_Panel


var slot_x: int
var slot_y: int
var skill: Skill_Data

func set_skill(new_skill: Skill_Data) -> void:
	skill = new_skill
	if skill == null:
		print("No skill input to _set_skill() on Skill_Board_Slot_Panel.")
		pass
	else:
		for child in get_children():
			child.queue_free()
