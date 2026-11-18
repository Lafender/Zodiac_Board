extends Item_Data
class_name Ingredient_Data

enum Ingredient_Type {
    INK,
    WAX,
    BLOCK,
    PAPER,
    DYE
}
export(Ingredient_Type) var ingredient_type
export(String) var ingredient_code