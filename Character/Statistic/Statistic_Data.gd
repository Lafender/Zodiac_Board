extends Resource
class_name Statistic_Data

export var name: String
export var icon: Texture

export var level:= {
	"base": 1,
	"current": 1,
	"max": 999999999
}

## Multiplies with base_statistic and product is added after every job level gained.
export(float, 0, 4, 0.2) var base_statistic_multiplier: float

## Multiplier for how much stat will adjust based on current flux.
export(float, 0, 4, 0.2) var flux_deviance: float
