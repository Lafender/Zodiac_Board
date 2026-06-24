extends Item_Data
class_name Equipment_Data


## Multiplies with character stat (based on skill domain), 
## to get total outgoing damage (total_damage) before defense subtractions
## for PHYSICAL and TEMPERED attacks, 
## and multiples with multiplier after it has been derived from 
## stats and defense subtractions in MAGICAL and SPIRITUAL attacks.
# Need to find a better way to differentiate how different Domains and 
# Elements are calculated based on Statistics.
export(int) var base_power = 100
# Speed is attacks per 100 seconds.
export(int) var speed = 100

## PHYSICAL and TEMPERED use Kinetic Points for attack damage, and vs Break Points "directly" ( total_damage - Break Points = final_damage ).
## MAGICAL uses Logic Points for attack power multiplier, and is vs Aura Points where based power matters more than stats ( (Logic/2) - (Aura/2) = multiplier ), ( multiplier*base_power = final damage).
## SPIRITUAL uses Aura points to find damage and is vs Will Points to find damage multiplier ( (Aura/2) - (Will/2) = multiplier), (multiplier*base_power = final_damage).
export(Resource) var domain_data
export(Resource) var element_data

export(bool) var is_equipped = false
