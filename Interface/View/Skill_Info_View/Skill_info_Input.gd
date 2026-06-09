extends Node
class_name Skill_Info_Input

@onready var view: Skill_Info_View = get_parent()

const SCROLL_SPEED := 10.0

func _process(delta: float) -> void:
	# Toggle which panel is controlled
	if Input.is_action_just_pressed("view_button"):
		view.toggle_control_target()

	# Right stick vertical axis (assuming "rs_y" action)
	var rs_y := Input.get_action_strength("rs_down") - Input.get_action_strength("rs_up")
	if abs(rs_y) > 0.1:
		view.scroll_active_panel(rs_y * SCROLL_SPEED)
