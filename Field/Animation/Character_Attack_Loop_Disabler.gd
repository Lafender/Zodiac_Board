extends Reference
class_name Character_Attack_Loop_Disabler

# animation_finished only fires for animations that do not loop, so make sure attack_* never loops.


static func disable(sprite: AnimatedSprite, animation_set: Animation_Set_Data) -> void:
	if sprite.frames == null:
		return
	for direction in animation_set.get_direction_names():
		var animation_name := Animation_Name_Builder.build(animation_set, animation_set.attack_prefix, direction)
		if sprite.frames.has_animation(animation_name):
			sprite.frames.set_animation_loop(animation_name, false)
