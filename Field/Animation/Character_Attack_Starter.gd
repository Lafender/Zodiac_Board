extends Reference
class_name Character_Attack_Starter

# Starts attack_<facing direction> from its first frame. Ignored while already attacking.


static func start(sprite: AnimatedSprite, character_data: Resource, animation_set: Animation_Set_Data, state: Character_Animation_State_Data) -> bool:
	if state.is_attacking:
		return false
	var facing := Facing_Direction_Accessor.read(character_data)
	var direction := Facing_Direction_Name_Resolver.resolve(facing, animation_set)
	var attack_name := Animation_Name_Builder.build(animation_set, animation_set.attack_prefix, direction)
	if not Character_Animation_Player.play(sprite, attack_name, state):
		return false
	state.is_attacking = true
	sprite.frame = 0
	return true
