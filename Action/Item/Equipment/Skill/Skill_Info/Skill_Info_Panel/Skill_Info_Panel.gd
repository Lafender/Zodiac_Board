extends Panel
class_name Skill_Info_Panel


export(NodePath) onready var name1 = $CenterContainer/VBoxContainer/ID/Name/Name_Label
export(NodePath) onready var name2 = $CenterContainer/VBoxContainer/ID/Name/Name2_Label
export(NodePath) onready var name3 = $CenterContainer/VBoxContainer/ID/Name/Name3_Label
export(NodePath) onready var icon_rect = $CenterContainer/VBoxContainer/ID/Icon/Icon_TextureRect

export(NodePath) onready var strip = $CenterContainer/VBoxContainer/ID/Icon/Strip
export(NodePath) onready var code_label = $CenterContainer/VBoxContainer/ID/Icon/Strip/CenterContainer/Code_Label

export(NodePath) onready var base_power_label = $CenterContainer/VBoxContainer/Power/HBoxContainer/Power_Label
export(NodePath) onready var speed_label = $CenterContainer/VBoxContainer/Speed/HBoxContainer/Speed_Label
export(NodePath) onready var cost_label = $CenterContainer/VBoxContainer/Cost/HBoxContainer/Cost_Label
export(NodePath) onready var target_gauge_label = $CenterContainer/VBoxContainer/Cost/HBoxContainer/Gauge_Label

export(NodePath) onready var domain_label = $CenterContainer/VBoxContainer/Domain_and_Element/Panel/Domain/CenterContainer2/VBoxContainer/Domain_Label
export(NodePath) onready var domain_icon = $CenterContainer/VBoxContainer/Domain_and_Element/Panel/Domain/CenterContainer/Domain_TexutureRect
export(NodePath) onready var element_label = $CenterContainer/VBoxContainer/Domain_and_Element/Panel2/Element/CenterContainer2/VBoxContainer/Element_Label
export(NodePath) onready var element_icon = $CenterContainer/VBoxContainer/Domain_and_Element/Panel2/Element/CenterContainer/Element_TextureRect

export(NodePath) onready var price_label = $CenterContainer/VBoxContainer/Price/HBoxContainer/Price_Label
export(NodePath) onready var owned_label = $CenterContainer/VBoxContainer/Owned/HBoxContainer/Owned_Label

export var effects: PoolStringArray

export(Vector2) var viewport_dimensions:= Vector2(1024, 600)

export(Resource) var selected_skill
export(Resource) var inventory

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _setup_panel(skill: Skill_Data):
	selected_skill = skill
	name1.text =  skill.skill_name_part_1
	name2.text =  skill.skill_name_part_2
	name3.text =  skill.skill_name_part_3
	icon_rect.texture = skill.icon
	
	code_label.text = skill.code    # 4‑char alphanumeric
	strip.get_stylebox("panel").bg_color = skill.color_code
	
	
	base_power_label.text = String(skill.base_power)
	speed_label.text = String(skill.speed)
	cost_label.text = String(skill.cost)
	target_gauge_label.text = skill.target_gauge.name
	
	domain_label.text =  skill.domain_data.name
	domain_icon.texture = skill.domain_data.icon 
	element_label.text = skill.element_data.name
	element_icon.texture = skill.element_data.icon
	
	price_label.text = String(skill.price)
	if inventory.item_sums.has(skill.code):
		owned_label.text = String(inventory.item_sums[skill.code])
	else:
		owned_label.text = String(0)


