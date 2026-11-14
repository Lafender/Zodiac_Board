extends Statistic_Data
class_name Base_Statistic_Data


# Aura Stat
## Increases Magical and Spiritual damage resistance
## and outgoing Spiritual damage
export var aura_stat: int

# Break Stat
## Increases Physical and Tempered damage resistance
export var break_stat: int

# Gear Stat
## Increases outgoing Physical and Tempered damage
export var kinetic_stat: int

# Drive Stat
## Increases outgoing Magical damage
export var logic_stat: int


# Health Pool
## When this stat current pool reaches zero or below:
## the Character can no longer fight.
## Does not regenerate naturally
export var health_pool: int

# Rune Pool
## Skill Usage requirement for Magical Cards
## Increases Magical and Spiritual damage
## Regenerates over time
export var rune_pool: int

# Shield Pool
## Takes damage instead of Health until
## it reaches zero or below
## Regenerates over time after a few seconds
## of not being hit by an attack
export var shield_pool: int

# Thread Pool
## Used for regenerating either:
## Rune or Health pool
## Regenerates when dealing Damage
export var thread_pool: int


# Flux Stat
## Buffs elemental chemistry effects
export var flux_stat: Resource

# Wind Stat
## Buffs Focus time slowing effect
## Increases attacks_per_second
export var wind_stat: int

# Zero Stat
## Decreases all damage done to shield_points
export var zero_stat: int