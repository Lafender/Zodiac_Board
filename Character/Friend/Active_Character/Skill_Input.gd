extends Node
class_name Skill_Input

var target: Active_Character
var current_tween: Tween

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("face_a"):
		_execute_skill("A")
	if Input.is_action_just_pressed("face_b"):
		_execute_skill("B")
	if Input.is_action_just_pressed("face_x"):
		_execute_skill("X")
	if Input.is_action_just_pressed("face_y"):
		_execute_skill("Y")

func _execute_skill(button: String) -> void:
	if target == null or target.character_data == null:
		return
	var board := target.character_data.skill_board
	if board == null:
		return

	var skill: Skill_Data = board.get_skill(button)
	if skill == null:
		return

	_play_attack_animation(skill)
	_play_skill_tween(skill)

func _play_attack_animation(_skill: Skill_Data) -> void:
	var base_speed := 1.0
	var final_speed := base_speed
	target.sprite.play_attack(final_speed)

func _play_skill_tween(skill: Skill_Data) -> void:
	if current_tween:
		current_tween.kill()

	current_tween = target.create_tween()

	var start_pos := target.position
	var end_pos := start_pos + skill.tween_offset

	if skill.tween_is_start_animation:
		current_tween.tween_property(target, "position", end_pos, skill.tween_duration)
		current_tween.tween_property(target, "position", start_pos, skill.tween_duration)
	elif skill.tween_is_active_animation and skill.tween_loop:
		current_tween.set_loops()
		current_tween.tween_property(target, "position", end_pos, skill.tween_duration)
		current_tween.tween_property(target, "position", start_pos, skill.tween_duration)
