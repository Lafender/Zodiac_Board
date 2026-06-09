extends Resource
class_name Character_Data

@export var name: String
@export var race: String
@export var job_level: int
@export var statistics: Statistic_Set_Data

@export_group("Character Skills")
@export var equipped_skill_set: Skill_Set_Data
@export var skill_board: Skill_Board_Data

@export_group("Character Weapons")
@export var loaded_weapon: String
@export var weapon_loadout: Weapon_Loadout
