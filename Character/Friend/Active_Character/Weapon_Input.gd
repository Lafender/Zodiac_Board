extends Node
class_name WeaponInput

var target: Active_Character

func _process(delta):
	if Input.is_action_just_pressed("weapon_trigger"):
		_attack()

	if Input.is_action_just_pressed("dpad_right"):
		target.character_data.weapon_loadout.next_weapon()

	if Input.is_action_just_pressed("dpad_left"):
		target.character_data.weapon_loadout.previous_weapon()

func _attack():
	var weapon := target.character_data.weapon_loadout.get_active_weapon()
	if weapon:
		target.sprite.play_attack()
		print("Using weapon:", weapon.weapon_name)
