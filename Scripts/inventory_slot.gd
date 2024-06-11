extends Control

@onready var item_icon = $"Inner Border/Item Icon"
@onready var item_quantity = $"Inner Border/Item Quantity"
@onready var details_panel = $"Details Panel"
@onready var item_name = $"Details Panel/Item Name"
@onready var item_type = $"Details Panel/Item Type"
@onready var item_effect = $"Details Panel/Item Effect"
@onready var usage_panel = $"Usage Panel"

# Slot item
var item = null

func _on_item_button_mouse_entered():
	if item != null:
		usage_panel.visible = false
		details_panel.visible = true

func _on_item_button_mouse_exited():
	details_panel.visible = false
	if usage_panel.visible:
		usage_panel.visible = false

func _on_item_button_pressed():
	if item != null:
		usage_panel.visible = !usage_panel.visible

func set_empty():
	item_icon.texture = null
	item_quantity.text = ""

func set_item(newItem):
	item = newItem
	item_icon.texture = newItem["texture"]
	item_quantity.text = str(item["quantity"])
	item_name.text = str(item["name"])
	item_type.text = str(item["type"])
	
	if item["effect"] != "":
		item_effect.text = str("+ ", item["effect"])
	else:
		item_effect.text = ""
