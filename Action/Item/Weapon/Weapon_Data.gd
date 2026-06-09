extends Resource
class_name Weapon_Data

@export_group("ID")
@export var name: String
@export var icon: Texture2D

@export_group("Weapon Power")
@export var base_power: int
@export_range(0.5, 8.0, 0.5) var attacks_per_second: float
@export var domain: Domain_Data
@export var element: Element_Data
