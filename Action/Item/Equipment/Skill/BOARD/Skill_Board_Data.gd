extends Resource
class_name Skill_Board_Data

export var width: int = 8
export var height: int = 8

var slots

var dpad_group: Array = []
var face_group: Array = []

func _init() -> void:
	if slots.size() != width * height:
		slots.resize(width * height)
	_generate_groups()

func _generate_groups() -> void:
	dpad_group.clear()
	face_group.clear()

	var region_w := width / 4
	var region_h := height / 4

	for y in height:
		dpad_group.append([])
		face_group.append([])

		for x in width:
			# --- DPAD grouping (quadrants) ---
			var dpad := ""
			if y < height / 2:
				dpad = "up"
			else:
				dpad = "down"
			if x < width / 2 and y >= height / 2:
				dpad = "left"
			elif x >= width / 2 and y >= height / 2:
				dpad = "right"
			dpad_group[y].append(dpad)
			
			# --- Face-button grouping (4×4 regions) ---
			var rx : int = x / region_w  # 0..3
			var ry : int = y / region_h  # 0..3
			var idx := (ry % 2) * 2 + (rx % 2)  # 0..3
			var face := ""
			match idx:
				0: face = "X"
				1: face = "Y"
				2: face = "A"
				3: face = "B"
			face_group[y].append(face)

func get_index(x: int, y: int) -> int:
	return y * width + x

func get_slot(x: int, y: int) -> Skill_Data:
	var idx := get_index(x, y)
	return slots[idx] if idx >= 0 and idx < slots.size() else null

func set_slot(x: int, y: int, skill: Skill_Data) -> void:
	var idx := get_index(x, y)
	if idx >= 0 and idx < slots.size():
		slots[idx] = skill

func get_skill(button: String) -> Skill_Data:
	for y in height:
		for x in width:
			if face_group[y][x] == button:
				return get_slot(x, y)
	
	print("Error getting button.Skill_Data at Skill_Board_Data._get_skill()")
	#var file = File.new()
	#file.open("res://Action/Item/Skill/LIST/Skill_9999.tres", File.READ)
	var skill = load("res://Action/Item/Skill/LIST/Skill_9999.tres")
	#ile.close()
	return skill
