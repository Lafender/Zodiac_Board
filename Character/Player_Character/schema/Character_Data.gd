extends Resource
class_name Character_Data

export(String) var character_name
export(Resource) var race
export(Resource) var statistics

# Equipment
export(Resource) var job_catalog
export(Resource) var skill_deck
export(Resource) var weapon

export var facing_direction := Vector2.DOWN