extends Resource
class_name Domain_Data

export var name: String
export var icon: Texture

# Interactiom affects the damage dealt by this Domain/Element when attacking these Domains.
# Resources are interactions from res://Action/Chemistry/Interaction/Interaction_List.

export var PHYSICAL: Resource
export var MAGICAL: Resource
export var SPIRITUAL: Resource
export var TEMPERED: Resource
