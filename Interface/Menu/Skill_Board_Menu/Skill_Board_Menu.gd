extends Control
class_name Skill_Board_Menu

@export var active_character: Active_Character

@onready var inventory_view: Skill_Inventory_View = $HBoxContainer/Skill_Inventory_View
@onready var board_view: Skill_Board_View = $HBoxContainer/VBoxContainer/Skill_Board_View
@onready var info_view: Skill_Info_View = $HBoxContainer/VBoxContainer/Skill_Info_View

func _ready() -> void:
	if active_character and active_character.character_data:
		board_view.set_board_data(active_character.character_data.skill_board)

	# Connect inventory selection → info panel
	inventory_view.chip_selection_changed.connect(_on_inventory_chip_selection_changed)
	# Connect board selection → info panel
	board_view.slot_selection_changed.connect(_on_board_slot_selection_changed)
	# Equip request from board input
	board_view.equip_requested.connect(_on_equip_requested)

func _on_inventory_chip_selection_changed(chip: Skill_Data) -> void:
	info_view.set_inventory_skill(chip)

func _on_board_slot_selection_changed(chip: Skill_Data) -> void:
	info_view.set_board_skill(chip)

func _on_equip_requested() -> void:
	var chip := inventory_view.get_selected_chip()
	if chip == null:
		return
	board_view.equip_chip(chip)
	inventory_view.mark_chip_equipped(chip)
	# Push to character data (board_view already writes into Skill_Board_Data)
	if active_character and active_character.character_data:
		active_character.character_data.skill_board = board_view.board_data
