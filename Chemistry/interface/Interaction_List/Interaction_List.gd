extends Resource
class_name Interaction_List


# Interaction type affects type of damage dictacted by interaction type drop-down. 
# REFLECT, TITHE and REGEN use an optional self_damage and  value for damage/healing received. 
# ABSORB makes all damage inflicted into healing instead, and SUSTAIN makes the element deals damage over time. 
# In SUSTAIN, set the durarion value and interval values to non-zero values, and make sure interval is lower than duration (preferably less than half).

export var ZERO: Resource
export var RESIST: Resource
export var NORMAL: Resource
export var BOOST: Resource
export var ULTIA: Resource
export var REFLECT: Resource
export var ABSORB: Resource
export var TITHE: Resource
export var REGEN: Resource
export var SUSTAIN: Resource
export var SIPHON: Resource
export var DIMINISH: Resource
