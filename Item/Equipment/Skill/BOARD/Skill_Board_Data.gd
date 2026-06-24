extends Resource
class_name Skill_Board_Data

export var width: int = 8
export var height: int = 8



var slots: Dictionary = {
	"LEFT": {
		"X": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"Y": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"A": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"B": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		}
	},
	"UP": {
		"X": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"Y": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"A": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"B": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		}
	},
	"DOWN": {
		"X": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"Y": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"A": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"B": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		}
	},
	"RIGHT": {
		"X": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"Y": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"A": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		},
		"B": {
			"X": Resource,
			"Y": Resource,
			"A": Resource,
			"B": Resource
		}
	},
	
}

export var size: String = "MAX"
var slots_array: Array

func _init() -> void:
	if size == "SINGLE":
		slots_array.resize(4)
		width = 2
		height = 2
	elif size == "DOUBLE":
		slots_array.resize(8)
		width = 4
		height = 2
	elif size == "SQUARE":
		slots_array.resize(16)
		width = 4
		height = 4
	elif size == "LONG":
		slots_array.resize(32)
		width = 4
		height = 8
	elif size == "MAX":
		slots_array.resize(64)
		width = 8
		height = 8
	pass


func _get_groups_from_idx(idx: int):
	var groups = {
		"dpad_group": "NONE",
		"face_group": "NONE",
		"input_group": "NONE",
		"skill": Resource
	}
	pass



func set_skill(dpad_group: String, face_group: String, input_group: String, skill: Skill_Data) -> void:
	slots[dpad_group][face_group][input_group] = skill
	pass


func get_skill(dpad_group: String, face_group: String, input_group: String) -> Resource:
	return slots[dpad_group][face_group][input_group]

