extends Resource
class_name Base_Statistic_Data


# Aura Stat
## Increases Magical and Spiritual damage resistance
## and outgoing Spiritual damage
export var base_aura: int

# Break Stat
## Increases Physical and Tempered damage resistance
export var base_break: int

# Gear Stat
## Increases outgoing Physical and Tempered damage
export var base_kinetic: int

# Drive Stat
## Increases outgoing Magical damage
export var base_logic: int

# Flux Stat
## Buffs elemental chemistry effects
export var base_flux: Resource

# Wind Stat
## Buffs Focus time slowing effect
## Increases attacks_per_second
export var base_wind: int

# Zero Stat
## Decreases all damage done to shield_points
export var base_zero: int



# Health Pool
## When this stat current pool reaches zero or below:
## the Character can no longer fight.
## Does not regenerate naturally
export var base_health: int

# Rune Pool
## Skill Usage requirement for Magical Cards
## Increases Magical and Spiritual damage
## Regenerates over time
export var base_rune: int

# Shield Pool
## Takes damage instead of Health until
## it reaches zero or below
## Regenerates over time after a few seconds
## of not being hit by an attack
export var base_shield: int

# Thread Pool
## Used for regenerating either:
## Rune or Health pool
## Regenerates over time
export var base_thread: int


