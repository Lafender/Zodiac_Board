extends Reference
class_name Facing_Direction_Accessor

# The only place that knows the property name inside Character_Data.
# Add `export var facing_direction := Vector2.DOWN` to Character_Data.gd, or change FIELD_NAME here.

const FIELD_NAME := "facing_direction"
const FALLBACK_DIRECTION := Vector2.DOWN


static func read(character_data: Resource) -> Vector2:
	if character_data == null:
		return FALLBACK_DIRECTION
	var value = character_data.get(FIELD_NAME)
	if typeof(value) != TYPE_VECTOR2:
		return FALLBACK_DIRECTION
	return value


static func write(character_data: Resource, direction: Vector2) -> void:
	if character_data != null:
		character_data.set(FIELD_NAME, direction)


static func warn_if_missing(character_data: Resource) -> void:
	if character_data == null:
		push_warning("Facing_Direction_Accessor: no Character_Data assigned")
	elif not (FIELD_NAME in character_data):
		push_warning("Facing_Direction_Accessor: Character_Data has no '" + FIELD_NAME + "' variable")
