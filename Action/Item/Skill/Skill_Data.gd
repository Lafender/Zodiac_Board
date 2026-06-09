extends Resource
class_name Skill_Data

@export_group("ID")
@export var skill_name: String
@export var icon: Texture2D
# Chip metadata for the board UI
@export var chip_code: String = ""      # 4‑char alphanumeric
@export var chip_color: Color = Color.WHITE

@export_group("Power")
## Multiplies with character stat (based on skill domain), to get total outgoing damage (total_damage) before defense subtractions for PHYSICAL and TEMPERED attacks, and multiples with multiplier after it has been derived from stats in MAGICAL and SPIRITUAL attacks.
@export var base_power:= 100
@export var speed: int
@export var effects: Array[String]

@export_group("Chemisty")
## PHYSICAL and TEMPERED use Kinetic Points for attack damage, and vs Break Points "directly" ( total_damage - Break Points = final_damage ).
## MAGICAL uses Logic Points for attack power multiplier, and is vs Aura Points where based power matters more than stats ( (Logic/2) - (Aura/2) = multiplier ), ( multiplier*base_power = final damage).
## SPIRITUAL uses Aura points to find damage and is vs Will Points to find damage multiplier ( (Aura/2) - (Will/2) = multiplier), (multiplier*base_power = final_damage).
@export var domain_data: Domain_Data
@export var element_data: Element_Data

@export_group("Gauge Cost")
enum gauge {HEALTH, RUNE, ENGINE, THREAD, ZERO}
@export var cost: int
@export var target_gauge: gauge


@export_group("Skill Animation")
## Set of animations to use for full skill animation. Individual parts can be marked as looping. if multiple looping tweens are tagged in a row, they are to play consecutively in order and then loop back to the first one when complete until button being held down for skill_input is released.
@export var animation: Array[Skill_Tween_Profile]
