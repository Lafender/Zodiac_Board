extends Statistic_Data
class_name Base_Statistic_Data

## Static Statistics can't be upgraded throough the Job Catalog.
@export_group("Base Statistic Data")
## has various effects depending on the statistic
@export var power: int

## Use notes to describe unique base_statistic effect.
@export_multiline var notes: String
