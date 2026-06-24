extends Resource
class_name Weapon_Loadout
# Three weapon slots
@export var slots: Array[Weapon_Data] = [null, null, null]

# Index of the currently selected slot (0, 1, 2)
var active_index := 0

func equip_weapon(slot_index: int, weapon: Weapon_Data) -> void:
	if slot_index < 0 or slot_index >= slots.size():
		push_error("Invalid weapon slot: %s" % slot_index)
		return
	slots[slot_index] = weapon

func dequip_weapon(slot_index: int) -> void:
	if slot_index < 0 or slot_index >= slots.size():
		push_error("Invalid weapon slot: %s" % slot_index)
		return
	slots[slot_index] = null

func next_weapon() -> void:
	active_index = (active_index + 1) % slots.size()

func previous_weapon() -> void:
	active_index = (active_index - 1 + slots.size()) % slots.size()

func get_active_weapon() -> Weapon_Data:
	return slots[active_index]
