extends Control
class_name Skill_Inventory_View

signal chip_selection_changed(chip: Skill_Data)

@export var visible_columns: int = 3
@export var total_rows: int = 10 # 3x10 = 30
@export var chip_list: Array[Skill_Data] = []

@onready var scroll: ScrollContainer = $Panel/ScrollContainer
@onready var grid: GridContainer = $Panel/ScrollContainer/BoxContainer/GridContainer
@onready var highlight: Control = $Panel/Selection_Highlight

var selected_index: int = 0

func _ready() -> void:
	grid.columns = visible_columns
	_build_grid()
	_update_highlight()

func _build_grid() -> void:
	grid.queue_free_children()
	for i in chip_list.size():
		var chip: Skill_Data = chip_list[i]
		var panel: Skill_Chip_Panel = preload("res://Interface/Panel/Skill_Chip_Panel/Skill_Chip_Panel.tscn").instantiate()
		panel.set_chip(chip)
		grid.add_child(panel)

func move_selection(dx: int, dy: int) -> void:
	var cols := visible_columns
	var rows := int(ceil(float(chip_list.size()) / float(cols)))
	var x := selected_index % cols
	var y := selected_index / cols

	x = clamp(x + dx, 0, cols - 1)
	y = clamp(y + dy, 0, rows - 1)

	var new_index := y * cols + x
	if new_index < 0 or new_index >= chip_list.size():
		return

	selected_index = new_index
	_update_highlight()
	_emit_selection_signal()

func _update_highlight() -> void:
	if selected_index < 0 or selected_index >= grid.get_child_count():
		highlight.visible = false
		return
	highlight.visible = true
	var target_panel: Control = grid.get_child(selected_index)
	highlight.global_position = target_panel.global_position
	highlight.size = target_panel.size
	# Ensure selected panel is visible
	scroll.ensure_control_visible(target_panel)

func _emit_selection_signal() -> void:
	var chip := get_selected_chip()
	chip_selection_changed.emit(chip)

func get_selected_chip() -> Skill_Data:
	if selected_index < 0 or selected_index >= chip_list.size():
		return null
	return chip_list[selected_index]

func mark_chip_equipped(chip: Skill_Data) -> void:
	for child in grid.get_children():
		var panel := child as Skill_Chip_Panel
		if panel and panel.chip == chip:
			panel.set_equipped(true)
