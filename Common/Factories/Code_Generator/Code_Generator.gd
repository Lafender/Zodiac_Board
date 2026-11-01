extends Resource
class_name Code_Generator

export var code_length: int = 4
export var use_symbols: bool = false

export var spearator_list:=  ["None", "-", "_", ".", "/", "#", "@"]
export var separator: String
export var segment_lengths: Array = [4]  # e.g. [3, 2, 3] → "ABC-DE-FGH"

export var base_chars := "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
export var symbol_chars := "!@#$%^&*+-=?"

var rng := RandomNumberGenerator.new()

func _init() -> void:
	rng.randomize()

# ---------------------------------------------------------
# BASIC RANDOM CODE
# ---------------------------------------------------------

func generate_code(length: int = code_length) -> String:
	var pool := base_chars
	if use_symbols:
		pool += symbol_chars

	var s := ""
	for i in length:
		s += pool[rng.randi_range(0, pool.length() - 1)]
	return s

# ---------------------------------------------------------
# CUSTOM SYMBOL INSERTION
# ---------------------------------------------------------

func generate_code_with_custom_symbol(length: int, symbol: String, positions: Array) -> String:
	var s := ""
	for i in length:
		if positions.has(i):
			s += symbol
		else:
			s += base_chars[rng.randi_range(0, base_chars.length() - 1)]
	return s

# ---------------------------------------------------------
# SEGMENTED FULL CODE
# ---------------------------------------------------------

func generate_full_code() -> String:
	var sep := ""
	if separator != "None":
		sep = separator

	var parts := []
	for seg_len in segment_lengths:
		parts.append(generate_code(seg_len))

	return sep.join(parts)
