extends Statistic_Data
class_name Flux_Statistic_Data

## Flux Range variables are equal to damage multiplier at that point in the flux meter.
## The range_min is the minimum damage multiplier.
export(float, 0.0, 1.0, 0.5) var range_min
## The range_max is the maximum damage multiplier.
export(float, 1.0, 4.0, 0.5) var range_max: float

## Flux_Statistic.speed is character multiplier for World Flux
export(float, 0.5, 8.0, 0.5) var speed: float

## Acceleration is indicatining tween data
enum acceleration {NONE, EASE_IN, EASE_OUT, BOTH}
export var acceleration_choices:= acceleration
export var inner_acceleration: String
export var outer_acceleration: String
