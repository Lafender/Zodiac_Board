extends Node
class_name Chip_Factory

@export var output_path := "res://Action/Skill/Skill_List/"

# External resources
@export var strip_palette: ColorPalette
@export var code_generator: Code_Generator
@export var icons: Array[Texture2D]

# Element / Domain / Gauge lists
@export var element_list: Element_List
@export var domain_list: Domain_List
@export var gauge_statistic_list: Gauge_Statistic_List

# ---------------------------------------------------------
# INTERNAL NAME POOLS (cannot disappear)
# ---------------------------------------------------------

const NAME_ROOTS := [
	"Astra", "Voro", "Luma", "Cryo", "Vita", "Noct", "Ferro", "Aero",
	"Sola", "Umbra", "Mythra", "Draco", "Flaer", "Vesper", "Arcan",
	"Lyra", "Venti", "Chrono", "Faye", "Rune", "Eldra", "Mistral"
]

const NAME_ACTIONS := [
	"Claw", "Burst", "Strike", "Blaze", "Crash", "Pulse", "Wave",
	"Slash", "Drift", "Pierce", "Bloom", "Snap", "Fang", "Drill",
	"Spiral", "Flash", "Bolt", "Crash", "Sweep", "Lunge"
]

const NAME_ADVERBS := [
	"Softly", "Brutally", "Swiftly", "Lovely", "Straight", "Wildly",
	"Brightly", "Quietly", "Sharply", "Heavily", "Gently", "Roughly",
	"Gracefully", "Boldly", "Fiercely", "Calmly", "Warmly"
]

# ---------------------------------------------------------
# READY
# ---------------------------------------------------------

func _ready():
	$UI/VBoxContainer/Button.pressed.connect(_generate_all)
	$UI/VBoxContainer/Button2.pressed.connect(_generate_single)
	$UI/VBoxContainer/Button3.pressed.connect(_preview_name)
	$UI/VBoxContainer/Button4.pressed.connect(_preview_code)

# ---------------------------------------------------------
# GENERATION
# ---------------------------------------------------------

@export var number_of_chips := 30

func _generate_all():
	for i in number_of_chips:
		_generate_skill(i)

func _generate_single():
	_generate_skill(randi() % 9999)

func _generate_skill(i: int):
	var skill := Skill_Data.new()

	# Name
	skill.skill_name = _generate_name()

	# Icon + strip
	skill.icon = icons[i % icons.size()]
	skill.chip_color = strip_palette.colors[i % strip_palette.colors.size()]
	skill.chip_code = code_generator.generate_full_code()

	# Stats
	skill.base_power = randi() % 50 + 10
	skill.speed = randi() % 10 + 1
	skill.effects = []  # no effects yet

	# Domain + Element (actual resource objects)
	skill.domain_data = _random_domain()
	skill.element_data = _random_element()

	# Gauge cost (placeholder)
	skill.cost = randi() % 10
	skill.target_gauge = Skill_Data.gauge.values()[randi() % Skill_Data.gauge.size()]

	# Animation (simple placeholder tween)
	skill.animation = [_generate_tween_profile()]

	# Save
	var file := "%s/Skill_%04d.tres" % [output_path, i]
	ResourceSaver.save(skill, file)

# ---------------------------------------------------------
# NAME GENERATION
# ---------------------------------------------------------

func _generate_name() -> String:
	var root : String = NAME_ROOTS[randi() % NAME_ROOTS.size()]
	var action : String = NAME_ACTIONS[randi() % NAME_ACTIONS.size()]
	var adv : String = NAME_ADVERBS[randi() % NAME_ADVERBS.size()]
	return "%s %s %s" % [root, action, adv]

# ---------------------------------------------------------
# RANDOMIZATION HELPERS
# ---------------------------------------------------------

func _random_element() -> Element_Data:
	var arr := [
		element_list.BASS, 
		element_list.TREBLE, 
		element_list.STRETCHED, 
		element_list.COMPRESSED,
		element_list.HEAT, 
		element_list.CHILL, 
		element_list.SIMPLE,
		element_list.COMPLEX,
		element_list.CONDUCTIVE, 
		element_list.MAGNETIC, 
		element_list.PULSE, 
		element_list.REFLECTIVE,
		element_list.RADIANT, 
		element_list.VOID, 
		element_list.PLASMA, 
		element_list.MASSIVE,
		element_list.QUANTUM, 
		element_list.ELECTRONIC, 
		element_list.SOLVENT, 
		element_list.OXIDIZING,
		element_list.PARTICLE, 
		element_list.LIMIT, 
		element_list.VECTOR, 
		element_list.MATRIX,
		element_list.DATA, 
		element_list.BINARY, 
		element_list.MEMORY, 
		element_list.GENETIC,
		element_list.ILLUSION, 
		element_list.OBSIDIAN, 
		element_list.STEAM, 
		element_list.SMOKE,
		element_list.PLASTIC, 
		element_list.GLASS, 
		element_list.LIQUID, 
		element_list.GEL, 
		element_list.NEON, 
		element_list.METAL, 
		element_list.CRYSTAL, 
		element_list.DIAMOND,
		element_list.GRADIENT, 
		element_list.RAINBOW, 
		element_list.CHROMATIC, 
		element_list.PRISMATIC,
		element_list.FRACTAL, 
		element_list.ORDERED, 
		element_list.CHAOTIC
	]
	return arr[randi() % arr.size()]

func _random_domain() -> Domain_Data:
	var arr := [
		domain_list.PHYSICAL,
		domain_list.MAGICAL,
		domain_list.SPIRITUAL,
		domain_list.TEMPERED
	]
	return arr[randi() % arr.size()]

func _generate_tween_profile() -> Skill_Tween_Profile:
	var t := Skill_Tween_Profile.new()
	t.tween_duration = randf_range(0.2, 0.8)
	t.tween_offset = Vector2(randf_range(-8, 8), randf_range(-8, 8))
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
