extends Equipment_Data
class_name Skill_Data

 

export var skill_name_part_1: String
export var skill_name_part_2: String
export var skill_name_part_3: String
# Chip metadata for the board UI


export var effects: PoolStringArray


enum gauge {HEALTH, RUNE, ENGINE, THREAD, ZERO}
export var target_gauge: Resource
export var cost: int

export var animation: Resource
