extends Node
class_name Movement

var target: Active_Character
var move_speed_base := 120.0

func _physics_process(delta):
	if not target:
		return
	_handle_movement(delta)

func _handle_movement(_delta):
	var input_vec := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)

	if input_vec.length() > 1.0:
		input_vec = input_vec.normalized()

	var speed := move_speed_base * input_vec.length()
	var velocity := input_vec * speed

	target.velocity = velocity
	target.move_and_slide()

	if velocity.length() > 1.0:
		target.sprite.play_walk()
	else:
		target.sprite.play_idle()
