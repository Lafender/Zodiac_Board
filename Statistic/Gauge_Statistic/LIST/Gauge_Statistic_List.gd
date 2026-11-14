extends Groups_Data
class_name Gauge_Statistic_List

# Health Pool
## When this stat current pool reaches zero or below:
## the Character can no longer fight.
## Only regenerates by using skills,
## items, or resting
export var health_pool: Resource

# Rune Pool
## Skill Usage requirement for Magical Cards
## Increases Magical and Spiritual damage
## Regenerates over time
export var rune_pool: Resource

# Shield Pool
## Takes damage instead of Health until
## it reaches zero or below
## Regenerates over time after a few seconds
## of not being hit by an attack
export var shield_pool: Resource

# Thread Pool
## Used for regenerating either:
## Rune or Health pool
## Regenerates when dealing Damage,
## dodging through incoming attacks,
## or blocking/parrying incoming attacks
export var thread_pool: Resource



