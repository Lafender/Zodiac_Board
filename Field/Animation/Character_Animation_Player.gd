extends Reference
class_name Character_Animation_Player

# Plays an animation only when it is not already playing. Warns once per missing animation.


static func play(sprite: AnimatedSprite, animation_name: String, state: Character_Animation_State_Data) -> bool:
	if sprite.frames == null or not sprite.frames.has_animation(animation_name):
		_warn_once(animation_name, state)
		return false
	if sprite.animation != animation_name or not sprite.playing:
		sprite.play(animation_name)
	return true


static func _warn_once(animation_name: String, state: Character_Animation_State_Data) -> void:
	if state.warned_names.has(animation_name):
		return
	state.warned_names[animation_name] = true
	push_warning("Character_Animation_Player: SpriteFrames has no animation '" + animation_name + "'")
