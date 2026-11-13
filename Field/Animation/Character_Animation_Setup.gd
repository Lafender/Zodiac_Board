extends Reference
class_name Character_Animation_Setup


static func prepare(animator: Node, sprite: AnimatedSprite, body: Node2D, animation_set: Animation_Set_Data, state: Character_Animation_State_Data) -> void:
	animator.process_priority = 10 # runs after Movement so facing is already up to date
	state.last_position = body.global_position
	Character_Attack_Loop_Disabler.disable(sprite, animation_set)
	sprite.connect("animation_finished", animator, "_on_animation_finished")
