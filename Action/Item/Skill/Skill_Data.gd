extends Item_Data
class_name Skill_Data


export var skill_name_part_1: String
export var skill_name_part_2: String
export var skill_name_part_3: String
# Chip metadata for the board UI

## Multiplies with character stat (based on skill domain), to get total outgoing damage (total_damage) before defense subtractions for PHYSICAL and TEMPERED attacks, and multiples with multiplier after it has been derived from stats in MAGICAL and SPIRITUAL attacks.
export var base_power:= 100
export var speed: int
export var effects: PoolStringArray


enum gauge {HEALTH, RUNE, ENGINE, THREAD, ZERO}
export var target_gauge: Resource
export var cost: int

export var animation: Resource
