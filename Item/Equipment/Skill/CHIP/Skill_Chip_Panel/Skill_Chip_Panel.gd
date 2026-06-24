extends PanelContainer
class_name Skill_Chip_Panel

export(NodePath) onready var icon_rect = $CenterContainer2/Panel/CenterContainer/TextureRect
export(NodePath) onready var strip = $CenterContainer/VBoxContainer/Panel
export(NodePath) onready var code_label = $CenterContainer/VBoxContainer/Panel/CenterContainer/Label
export(NodePath) onready var element_icon = $CenterContainer2/Panel/CenterContainer/TextureRect/Panel/CenterContainer/TextureRect
export(NodePath) onready var domain_icon = $CenterContainer2/Panel/CenterContainer/TextureRect/Panel/CenterContainer/TextureRect/Panel/CenterContainer/TextureRect

var skill_info_panel
export var chip: Resource

signal skill_chip_clicked(Skill_Data)




export(String) var dpad_group
export(String) var face_group
export(String) var input_group
export(int) var board_slot_index = -1


func _ready():
	set_chip(chip)
#	popup._setup_popuppanel(chip)

func set_chip(skill: Skill_Data) -> void:
	chip = skill
	
	domain_icon.texture = chip.domain_data.icon
	element_icon.texture = chip.element_data.icon
	strip.get_stylebox("panel").bg_color = chip.color_code
	
	icon_rect.texture = chip.icon
	code_label.text = chip.code
	

func set_board_slot(dpad_input: String, face_input: String, button_input: String, new_index):
	dpad_group = dpad_input
	face_group = face_input
	input_group = button_input
	board_slot_index = new_index
	pass

func get_skill_board_slot() -> Dictionary:
	var slot: Dictionary
	slot["dpad_group"] = get_parent().dpad_group
	slot["face_group"] = get_parent().face_group
	slot["input_group"] = get_parent().input_group
	slot["index"] = get_parent().index
	return slot


func set_equipped(equipped: bool, slot: Dictionary) -> void:
	modulate = Color(0.5, 0.5, 0.5, 1.0) if equipped else Color(1, 1, 1, 1)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func toggled(pressed):
#	if !button_pressed:
#		button_pressed = true
#		popup.visible = button_pressed
#		
#	else:
#		button_pressed = false
#		popup.visible = button_pressed
#		
func skill_chip_clicked():
	print("Skill Chip: \"" + chip.code + "\" clicked.")
	var path = String(get_path())
	var top_parent = get_tree().get_current_scene()
	if top_parent == $Skill_Chip_Panel:
		return
	else:
		_update_info_panel(top_parent)
		_update_skill_share_select(top_parent)
		


func _update_skill_share_select(top_parent):
	if top_parent.name != "Skill_Share":
		return
	else:
		top_parent.selected_skill_chip = chip
		print(top_parent.selected_skill_chip.code + " now selected chip for Skill Share.")


func _update_info_panel(top_parent):
		# var top_parent = get_parent().get_parent().get_parent().get_parent().get_parent()
	var info_panel = top_parent.find_node("Skill_Info_Panel", true, false)
	if info_panel != null:
		info_panel._setup_panel(chip)
#	emit_signal("skill_chip_clicked", chip)
#	popup._setup_popuppanel(chip)
#	if !visible:
#		popup.visible = true
#	else:
#		popup.visible = false
