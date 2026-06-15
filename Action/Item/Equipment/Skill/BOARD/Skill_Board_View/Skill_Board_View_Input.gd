extends Node
class_name Skill_Board_View_Input

@onready var view: Skill_Board_View = get_parent()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("dpad_left"):
		view.move_selection(-1, 0)
	if Input.is_action_just_pressed("dpad_right"):
		view.move_selection(1, 0)
	if Input.is_action_just_pressed("dpad_up"):
		view.move_selection(0, -1)
	if Input.is_action_just_pressed("dpad_down"):
		view.move_selection(0, 1)

	if Input.is_action_just_pressed("face_a"):
		view.request_equip()
