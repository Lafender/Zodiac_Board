extends Node
class_name Character_Animator

# Add one to every on-screen character (Active_Character, NPCs, party members).
# Plays idle_ / walk_ / attack_ + direction on that character's own AnimatedSprite.
# Call play_attack() from your combat or input code.

signal attack_finished

export(NodePath) var animated_sprite_path
export(NodePath) var body_path
export(Resource) var character_data
export(Resource) var animation_set

var animated_sprite: AnimatedSprite
var body: Node2D
var state := Character_Animation_State_Data.new()


func _ready() -> void:
	animated_sprite = get_node(animated_sprite_path)
	body = get_node(body_path)
	Character_Animation_Setup.prepare(self, animated_sprite, body, animation_set, state)


func _physics_process(_delta: float) -> void:
	Character_Animation_Step.run(animated_sprite, body, character_data, animation_set, state)


func play_attack() -> void:
	Character_Attack_Starter.start(animated_sprite, character_data, animation_set, state)


func _on_animation_finished() -> void:
	if Character_Attack_Finisher.finish(state):
		emit_signal("attack_finished")
