extends Panel
class_name Skill_Chip_Panel

@onready var icon_rect: TextureRect = $TextureRect
@onready var strip: Panel = $Panel
@onready var code_label: Label = $Panel/Label

var chip: Skill_Data

func set_chip(skill: Skill_Data) -> void:
	chip = skill
	icon_rect.texture = chip.icon
	strip.color = chip.chip_color
	code_label.text = chip.chip_code

func set_equipped(equipped: bool) -> void:
	modulate = Color(0.5, 0.5, 0.5, 1.0) if equipped else Color(1, 1, 1, 1)
