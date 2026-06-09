extends Resource
class_name Statistic_Data

@export_group("ID")
@export var name: String
@export var icon: Texture2D

@export_group("Statistic Data")

@export var level:= {
	"base": 1,
	"current": 1,
	"max": 999999999
}

## Multiplies with base_statistic and product is added after every job level gained.
@export_range(0, 4, 0.01, "or_greater") var base_statistic_multiplier: float

## Multiplier for how much stat will adjust based on current flux.
@export_range(0, 4, 0.01, "or_greater") var flux_deviance: float
