extends Resource
class_name Wind_Statistic_Data

export(int) var character_level = 1
export(int) var base_level
export(float) var default_time_slow_effect_modifier = 0.01
export(float) var per_level_time_slow_effect_multiplier = 1.00025
export(float) var time_slow_effect_buff = default_time_slow_effect_modifier
export(float) var default_attack_speed_modifier = 0.005
export(float) var per_level_attack_speed_multiplier = 1.012
export(float) var attack_speed_buff = default_attack_speed_modifier

func change_level(levels_added: int):
    character_level = character_level + levels_added
    var time_slow_effect_modifier = default_time_slow_effect_modifier
    var attack_speed_modifier = default_attack_speed_modifier
    var i = 0
    while(i < character_level):
        var time_slow_effect_addition = i * per_level_time_slow_effect_multiplier * base_level
        time_slow_effect_modifier = time_slow_effect_modifier + time_slow_effect_addition
        var attack_speed_addition = i * per_level_attack_speed_multiplier * base_level
        attack_speed_modifier = attack_speed_modifier + attack_speed_addition
        i = i + 1
    time_slow_effect_buff = time_slow_effect_modifier * default_time_slow_effect_modifier
    attack_speed_modifier = attack_speed_modifier * default_attack_speed_modifier

