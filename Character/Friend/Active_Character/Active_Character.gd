extends CharacterBody2D
class_name Active_Character

@export var character_data: Character_Data

@onready var sprite := $AnimatedSprite2D
@onready var movement := $Movement
@onready var skill_input := $Skill_Input
@onready var weapon_input := $Weapon_Input

func _ready():
	movement.target = self
	skill_input.target = self
	weapon_input.target = self

	sprite.owner_character = self
	sprite.initialize_character_animations()
