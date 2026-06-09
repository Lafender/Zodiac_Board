extends Resource
class_name Element_Interaction_Data

enum interaction_type {
	ZERO,
	RESIST,
	NORMAL,
	BOOST,
	ULTRA,
	REFLECT,
	ABSORB,
	TITHE,
	REGEN,
	SUSTAIN,
	SIPHON,
	DIMINISH
 }
enum gauge {HEALTH, RUNE, ENGINE, THREAD, ZERO}

@export var type: interaction_type

@export_group("Damage")
@export var target_gauge: gauge
@export_range(-4.0, 4.0, 0.25) var damage_multiplier:= 1.0
@export_range(0.0, 8.0, 0.25) var damage_duration:= 0.0
@export_range(0.0, 8.0, 0.25) var damage_interval:= 0.0

@export var self_gauge: gauge
@export_range(-4.0, 4.0, 0.25) var self_multiplier:= 0.0
@export_range(0.0, 8.0, 0.25) var self_duration:= 0.0
@export_range(0.0, 8.0, 0.25) var self_interval:= 0.0
