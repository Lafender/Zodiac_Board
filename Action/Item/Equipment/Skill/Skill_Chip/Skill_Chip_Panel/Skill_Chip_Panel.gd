extends Panel
class_name Skill_Chip_Panel

export(NodePath) onready var icon_rect = $Panel/CenterContainer/TextureRect
export(NodePath) onready var strip = $CenterContainer/VBoxContainer/Panel
export(NodePath) onready var code_label = $CenterContainer/VBoxContainer/Panel/CenterContainer/Label
export(NodePath) onready var element_icon = $Panel2/CenterContainer/TextureRect
export(NodePath) onready var domain_icon = $Panel2/CenterContainer/TextureRect/Panel/CenterContainer/TextureRect

var skill_info_panel
export var chip: Resource

signal skill_chip_clicked(Skill_Data)

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

func set_equipped(equipped: bool) -> void:
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
