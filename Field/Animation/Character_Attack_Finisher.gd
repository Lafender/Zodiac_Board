extends Reference
class_name Character_Attack_Finisher

# Returns true when this call ended an attack.


static func finish(state: Character_Animation_State_Data) -> bool:
	if not state.is_attacking:
		return false
	state.is_attacking = false
	return true
