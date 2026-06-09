extends Panel
class_name Skill_Board_Slot_Panel

@onready var icon_rect: TextureRect = $TextureRect
@onready var strip: ColorRect = $ColorRect
@onready var code_label: Label = $Label

var slot_x: int
var slot_y: int
var skill: Skill_Data

func set_skill(new_skill: Skill_Data) -> void:
	skill = new_skill
	if skill == null:
		icon_rect.texture = null
		strip.color = Color(0, 0, 0, 0)
		code_label.text = ""
	else:
		icon_rect.texture = skill.icon
		strip.color = skill.chip_color
		code_label.text = skill.chip_code
