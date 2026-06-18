extends Node
class_name Chip_Factory

export(String, DIR) var skills_path := "res://Action/Item/Equipment/Skill/LIST/"
const skill_panel_path := "res://Action/Item/Equipment/Skill/Skill_Chip/Skill_Chip_Panel/Skill_Chip_Panel.tscn"
export(NodePath) onready var grid_container = $UI/VBoxContainer/ScrollContainer/GridContainer
export(NodePath) onready var skill_info_panel = $UI/Skill_Info_Panel

# External resources
export var strip_palette: PoolColorArray
export var code_generator: Resource
export(String, DIR) var icons_dir
var icons: Array
var skills: Array

# Element / Domain / Gauge lists
export var element_list: Resource
export var domain_list:Resource
export var gauge_statistic_list: Resource

# ---------------------------------------------------------
# INTERNAL NAME POOLS (cannot disappear)
# ---------------------------------------------------------

const NAME_ROOTS := [
	"Astra", "Voro", "Luma", "Cryo", "Vita", "Noct", "Ferro", "Aero",
	"Sola", "Umbra", "Mythra", "Draco", "Flaer", "Vesper", "Arcan",
	"Lyra", "Venti", "Chrono", "Faye", "Rune", "Eldra", "Mistral", 
	"Fart", "Oscar", "Stim", "Lance", "Bone", "Vedlt", "Baste", "Create",
	"Opal", "Ruby", "Emerald", "Sapphire", "Mace", "Star"
]

const NAME_ACTIONS := [
	"Claw", "Burst", "Strike", "Blaze", "Crash", "Pulse", "Wave",
	"Slash", "Drift", "Pierce", "Bloom", "Snap", "Fang", "Drill",
	"Spiral", "Flash", "Bolt", "Felt", "Sweep", "Lunge", "Rampage",
	"Chase", "Waste", "Joke", "Poke", "Sit", "Cry", "Rise", "Trance",
	"Trace", "Brace", "Guess", "Shade", "Ace"
]

const NAME_ADVERBS := [
	"Softly", "Brutally", "Swiftly", "Lovely", "Straight", "Wildly",
	"Brightly", "Quietly", "Sharply", "Heavily", "Gently", "Roughly",
	"Gracefully", "Boldly", "Fiercely", "Calmly", "Warmly", "Hastey",
	"Shying", "Cutely", "Sweetly", "Awkwardly", "Smelly"
]

# ---------------------------------------------------------
# READY
# ---------------------------------------------------------

func _ready():
	print("hello!")
	_preload_all_textures(icons_dir)
	_refresh_all_skills()
	print(skills.size())
	var skill: Resource
	for i in skills.size():
		skill = load(skills[skills.size()-(i+1)])
		print("code: \"" + skill.code +"\"")
	_setup_info_panel(skill)
#	$UI/VBoxContainer/Button.pressed.connect(_generate_all())
#	$UI/VBoxContainer/Button2.pressed.connect(_generate_single())
#	$UI/VBoxContainer/Button3.pressed.connect(_preview_name())
#	$UI/VBoxContainer/Button4.pressed.connect(_preview_code())
	if icons.size() == 0:
		print("icons size empty")
	print(icons.size())
#	print(icons)


# ---------------------------------------------------------
# SETTING UP ARRAYS
# ---------------------------------------------------------


func _refresh_all_skills():
	skills = []
	for child in grid_container.get_children():
		child.queue_free()
	var dir_array = Directory_Array.new()
	dir_array.set_array(skills_path, ".tres")
	skills = dir_array.get_array()

	for skill_path in skills:
		var skill = load(skill_path)
		_add_skill_panel(skill)



func _preload_all_textures(folder_path):
	print("Loading Textures started.")
	var dir_array = Directory_Array.new()
	dir_array.set_array(folder_path, ".png")
	icons = dir_array.get_array()

# ---------------------------------------------------------
# GENERATION
# ---------------------------------------------------------

export var number_of_chips := 30


	
#	while i < grid_container.get_children().size() :
#		grid_container.get_children()[i]
	


func _generate_all():
	for i in number_of_chips:
		_generate_skill(i)
		_refresh_all_skills()

func _generate_single():
	_generate_skill(skills.size())
	_refresh_all_skills()

func _generate_skill(i: int) -> String:
	var skill := Skill_Data.new()
	skill.is_consumable = randi() % 1
	skill.is_tradable = true
	var price_roll_1 = randi() % 1
	var price_roll_2 = randi() % 3
	var price_roll_3 = randi() % 999999999999
	var price: int
	match price_roll_1:
		0: price = price_roll_3 / 2
		1: price = price_roll_3
	match price_roll_2:
		0: price = price / 8
		1: price = price / 4
		2: price = price / 2
		3: price = price
	skill.price = price
	# Name
	var name = _generate_name()
	skill.skill_name_part_1 = name[0]
	skill.skill_name_part_2 = name[1]
	skill.skill_name_part_3 = name[2]

	# Icon + strip
	skill.icon = load(icons[randi() % icons.size()])
	skill.color_code = strip_palette[randi() % strip_palette.size()]
	skill.code = code_generator.generate_full_code()

	# Stats
	skill.base_power = randi() %  4999 + 5000
	skill.speed = randi() % 1600 + 1
	skill.effects = []  # no effects yet

	# Domain + Element (actual resource objects)
	skill.domain_data = _random_domain()
	skill.element_data = _random_element()

	# Gauge cost (placeholder)
	skill.target_gauge = _random_gauge()
	var gauge_max: int
	match skill.target_gauge.name:
		"HEALTH": gauge_max = 3
		"RUNE": gauge_max = 9
		"ENGINE": gauge_max = 3
		"THREAD": gauge_max = 3
		"ZERO": gauge_max = 9
	skill.cost = randi() % gauge_max
	
	
	# Animation (simple placeholder tween)
	skill.animation = _generate_tween_profile()
	# Save
	var file := "%s/Skill_%04d.tres" % [skills_path, i]
	ResourceSaver.save(file, skill)
	
	return file

# ---------------------------------------------------------
# NAME GENERATION
# ---------------------------------------------------------

func _generate_name() -> Array:
	var root : String = NAME_ROOTS[randi() % NAME_ROOTS.size()]
	var action : String = NAME_ACTIONS[randi() % NAME_ACTIONS.size()]
	var adv : String = NAME_ADVERBS[randi() % NAME_ADVERBS.size()]
#	return "%s %s %s" % [root, action, adv]
	return [root, action, adv]

# ---------------------------------------------------------
# RANDOMIZATION HELPERS
# ---------------------------------------------------------

func _random_element() -> Resource:
	var arr := [
		element_list.INTENSITY.SIMPLE,
		element_list.INTENSITY.COMPLEX,
		element_list.INTENSITY.STRETCHED, 
		element_list.INTENSITY.COMPRESSED,
		element_list.INTENSITY.BASS, 
		element_list.INTENSITY.TREBLE, 
		element_list.INTENSITY.HEAT, 
		element_list.INTENSITY.CHILL, 
		element_list.INTENSITY.PULSE, 
		
		element_list.SCALE.VOID,  
		element_list.SCALE.MASSIVE,
		element_list.SCALE.PARTICLE, 
		element_list.SCALE.QUANTUM, 
		element_list.SCALE.ELECTRONIC, 
		element_list.SCALE.PLASMA,
		
		element_list.TRANSFER.CONDUCTIVE, 
		element_list.TRANSFER.MAGNETIC, 
		element_list.TRANSFER.REFLECTIVE,
		element_list.TRANSFER.RADIANT, 
		element_list.TRANSFER.SOLVENT, 
		element_list.TRANSFER.OXIDIZING,
		
		element_list.MINERAL.STEAM, 
		element_list.MINERAL.SMOKE,
		element_list.MINERAL.NEON, 
		element_list.MINERAL.LIQUID, 
		element_list.MINERAL.GEL, 
		element_list.MINERAL.METAL,
		element_list.MINERAL.GLASS, 
		element_list.MINERAL.OBSIDIAN, 
		element_list.MINERAL.CRYSTAL, 
		element_list.MINERAL.DIAMOND,
		element_list.MINERAL.PLASTIC, 
		
		element_list.PATTERN.GRADIENT, 
		element_list.PATTERN.RAINBOW, 
		element_list.PATTERN.CHROMATIC, 
		element_list.PATTERN.PRISMATIC,
		element_list.PATTERN.FRACTAL, 
		element_list.PATTERN.ORDERED, 
		element_list.PATTERN.CHAOTIC,
		
		element_list.VIRTUAL.LIMIT, 
		element_list.VIRTUAL.VECTOR, 
		element_list.VIRTUAL.MATRIX,
		element_list.VIRTUAL.DATA, 
		element_list.VIRTUAL.BINARY, 
		element_list.VIRTUAL.GENETIC,
		element_list.VIRTUAL.MEMORY, 
		element_list.VIRTUAL.ILLUSION
	]
	return arr[randi() % arr.size()]

func _random_domain() -> Resource:
	var arr := [
		domain_list.PHYSICAL,
		domain_list.MAGICAL,
		domain_list.SPIRITUAL,
		domain_list.TEMPERED
	]
	return arr[randi() % arr.size()]

func _random_gauge() -> Resource:
	var arr := [
		gauge_statistic_list.HEALTH_GAUGE,
		gauge_statistic_list.RUNE_GAUGE,
		gauge_statistic_list.ENGINE_GAUGE,
		gauge_statistic_list.THREAD_GAUGE,
		gauge_statistic_list.ZERO_GAUGE
	]
	return arr[randi() % arr.size()]

func _generate_tween_profile():
	var t := Skill_Tween_Profile.new()
	t.tween_duration = rand_range(0.2, 0.8)
	t.tween_offset = Vector2(rand_range(-8, 8), rand_range(-8, 8))
	t.tween_loop = randf() < 0.3
	t.tween_is_active_animation = t.tween_loop
	t.tween_is_start_animation = not t.tween_loop
	return t

# ---------------------------------------------------------
# PREVIEW BUTTONS
# ---------------------------------------------------------

func _preview_name():
	print(_generate_name())

func _preview_code():
	print(code_generator.generate_full_code())
	

func _add_skill_panel(skill: Resource) -> void: 
	var chip_panel = preload(skill_panel_path)
	var chip_panel_instance = chip_panel.instance()
	grid_container.add_child(chip_panel_instance)
	chip_panel_instance.set_chip(skill)


# ---------------------------------------------------------
# INFO PANEL
# ---------------------------------------------------------

func _setup_info_panel(skill: Resource):
	skill_info_panel._setup_panel(skill)
	pass
