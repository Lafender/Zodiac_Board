extends Resource
class_name Item_Data


## Acceptable item_types are:
## "Currency"
## "Ingredient"
## "Card"
## "Deck"
## "Page"

enum Item_Type {
    BACKPACK,
    CURRENCY,
    INGREDIENT,
    EQUIPMENT
}
export(String) var item_name
export(Item_Type) var item_type
export(Texture) var icon

export(bool) var is_tradable = true
export(int) var price = 1
export(int) var max_quantity = 999999

export(TextFile) var description
