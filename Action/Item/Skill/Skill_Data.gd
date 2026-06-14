extends Resource
class_name Skill_Data


export var skill_name_part_1: String
export var skill_name_part_2: String
export var skill_name_part_3: String
export var icon: Texture
# Chip metadata for the board UI
export var code: String = ""      # 4‑char alphanumeric
export var color_code: Color = Color.white

## Multiplies with character stat (based on skill domain), to get total outgoing damage (total_damage) before defense subtractions for PHYSICAL and TEMPERED attacks, and multiples with multiplier after it has been derived from stats in MAGICAL and SPIRITUAL attacks.
export var base_power:= 100
export var speed: int
export var effects: PoolStringArray

## PHYSICAL and TEMPERED use Kinetic Points for attack damage, and vs Break Points "directly" ( total_damage - Break Points = final_damage ).
## MAGICAL uses Logic Points for attack power multiplier, and is vs Aura Points where based power matters more than stats ( (Logic/2) - (Aura/2) = multiplier ), ( multiplier*base_power = final damage).
## SPIRITUAL uses Aura points to find damage and is vs Will Points to find damage multiplier ( (Aura/2) - (Will/2) = multiplier), (multiplier*base_power = final_damage).
export var domain_data: Resource
export var element_data: Resource


enum gauge {HEALTH, RUNE, ENGINE, THREAD, ZERO}
export var target_gauge: Resource
export var cost: int



## Set of animations to use for full skill animation. Individual parts can be marked as looping. if multiple looping tweens are tagged in a row, they are to play consecutively in order and then loop back to the first one when complete until button being held down for skill_input is released.
export var animation: PoolStringArray
