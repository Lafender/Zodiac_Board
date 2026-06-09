extends Statistic_Data
class_name Flux_Statistic_Data

## Flux Range variables are equal to damage multiplier at that point in the flux meter.
@export_group("Flux Range")
## The range_min is the minimum damage multiplier.
@export_range(0.0, 1.0, 0.005) var range_min: float
## The range_max is the maximum damage multiplier.
@export_range(1.0, 4.0, 0.05, "or_greater") var range_max: float

@export_group("Flux Speed")
## Flux_Statistic.speed is character multiplier for World Flux
@export_range(0.1, 8.0, 0.005) var speed: float

## Acceleration is saved as enum string indicating which multiplier to use
@export_subgroup("Acceleration")
enum acceleration {NONE, EASE_IN, EASE_OUT, BOTH}
@export var inner_acceleration: acceleration
@export var outer_acceleration: acceleration
