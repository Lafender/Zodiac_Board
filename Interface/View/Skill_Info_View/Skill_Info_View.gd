extends Control
class_name Skill_Info_View

@onready var inv_scroll: ScrollContainer = $HBoxContainer/Inventory_Info_Panel/ScrollContainer
@onready var inv_box: VBoxContainer = $HBoxContainer/Inventory_Info_Panel/ScrollContainer/VBoxContainer
@onready var board_scroll: ScrollContainer = $HBoxContainer/Skill_Board_Info_Panel/ScrollContainer
@onready var board_box: VBoxContainer = $HBoxContainer/Skill_Board_Info_Panel/ScrollContainer/VBoxContainer

var inventory_skill: Skill_Data
var board_skill: Skill_Data
var control_inventory: bool = true

func set_inventory_skill(skill: Skill_Data) -> void:
	inventory_skill = skill
	_update_panel(inv_box, skill)

func set_board_skill(skill: Skill_Data) -> void:
	board_skill = skill
	_update_panel(board_box, skill)

func _update_panel(box: VBoxContainer, skill: Skill_Data) -> void:
	var labels := box.get_children()
	if skill == null:
		for child in labels:
			if child is Label:
				child.text = ""
		return

	var idx := 0
	(labels[idx] as Label).text = "Name: %s" % skill.skill_name; idx += 1
	(labels[idx] as Label).text = "Domain: %s" % skill.domain; idx += 1
	(labels[idx] as Label).text = "Element: %s" % skill.element; idx += 1
	(labels[idx] as Label).text = "Power: %d" % skill.base_power; idx += 1
	(labels[idx] as Label).text = "Speed: %d" % skill.speed; idx += 1
	(labels[idx] as Label).text = "Effects: %s" % str(skill.effects)

func toggle_control_target() -> void:
	control_inventory = !control_inventory

func scroll_active_panel(amount: float) -> void:
	var scroll := inv_scroll if control_inventory else board_scroll
	var new_val := scroll.scroll_vertical + amount
	scroll.scroll_vertical = clamp(new_val, 0, scroll.get_v_scroll_bar().max_value)
