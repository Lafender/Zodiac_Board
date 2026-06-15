extends Resource
class_name Item_Data

export(Texture) var icon
export(Color) var color_code:= Color.red
export(String) var code:= "9999"

## PHYSICAL and TEMPERED use Kinetic Points for attack damage, and vs Break Points "directly" ( total_damage - Break Points = final_damage ).
## MAGICAL uses Logic Points for attack power multiplier, and is vs Aura Points where based power matters more than stats ( (Logic/2) - (Aura/2) = multiplier ), ( multiplier*base_power = final damage).
## SPIRITUAL uses Aura points to find damage and is vs Will Points to find damage multiplier ( (Aura/2) - (Will/2) = multiplier), (multiplier*base_power = final_damage).
export(Resource) var domain_data
export(Resource) var element_data

