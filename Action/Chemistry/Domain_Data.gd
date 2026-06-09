extends Resource
class_name Domain_Data

@export_group("ID")
@export var name: String
@export var icon: Texture2D

## Chemistry affects the damage dealt by this Domain/Element when attacking these Domains
@export_group("Domain Chemistry")
enum damage_effect {ZERO, RESIST, NORMAL, BOOST, ULTRA}
@export var PHYSICAL: damage_effect
@export var MAGICAL: damage_effect
@export var SPIRITUAL: damage_effect
@export var TEMPERED: damage_effect
