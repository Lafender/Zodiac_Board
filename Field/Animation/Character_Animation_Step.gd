extends Reference
class_name Character_Animation_Step

# One physics frame: detect movement, read facing, and play idle_/walk_<direction>.
# While an attack is playing the sprite is left alone.


static func run(sprite: AnimatedSprite, body: Node2D, character_data: Resource, animation_set: Animation_Set_Data, state: Character_Animation_State_Data) -> void:
	state.is_moving = Character_Movement_Detector.update(state, body.global_position, animation_set)
	if state.is_attacking:
		return
	var facing := Facing_Direction_Accessor.read(character_data)
	var direction := Facing_Direction_Name_Resolver.resolve(facing, animation_set)
	var prefix := Animation_Prefix_Chooser.choose(animation_set, state.is_moving)
	Character_Animation_Player.play(sprite, Animation_Name_Builder.build(animation_set, prefix, direction), state)
