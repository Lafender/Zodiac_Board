extends Resource
class_name Element_Interaction_List


# Interaction type affects type of damage dictacted by interaction type drop-down. 
# REFLECT, TITHE and REGEN use an optional self_damage and  value for damage/healing received. 
# ABSORB makes all damage inflicted into healing instead, and SUSTAIN makes the element deals damage over time. 
# In SUSTAIN, set the durarion value and interval values to non-zero values, and make sure interval is lower than duration (preferably less than half).


export var list:= [
	"ZERO",
	"RESIST",
	"NORMAL",
	"BOOST",
	"ULTRA",
	"REFLECT",
	"ABSORB",
	"TITHE",
	"REGEN",
	"SUSTAIN",
	"SIPHON",
	"DIMINISH"
]
