extends Resource
class_name Item_Data


export(Color) var color_code:= Color.red
export(String) var code:= "9999"
export(Texture) var icon

export(bool) var is_consumable = false
export(bool) var is_tradable = true


export(int) var price = 500
export(Resource) var recipe
export(int) var max_quantity = 999999

export(TextFile) var description
