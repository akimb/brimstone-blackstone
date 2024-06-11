extends Node

var inventory = []
var referencePlayer : Node = null
@onready var inventorySlots = preload("res://Scenes/inventory_slot.tscn")

#signal updateInventory

func _ready():
	inventory.resize(30)
#	setPlayerReference(referencePlayer)

func addItemToInventory(item):
	for i in range(inventory.size()):
		if inventory[i] != null\
		and inventory[i]["type"] == item["type"]\
		and inventory[i]["name"] == item["name"]: # this handles already existing items
			
			inventory[i]["quantity"] += item["quantity"]
			SignalBus.updateInventory.emit()
#			updateInventory.emit()

			return true # indicates successfull item add
		elif inventory[i] == null: # this handles new items
			
			inventory[i] = item
			SignalBus.updateInventory.emit()
#			updateInventory.emit()
			return true
	return false


func removeItemFromInventory():
	SignalBus.updateInventory.emit()
	
func expandInventory():
	SignalBus.updateInventory.emit()

func setPlayerReference(player):
	referencePlayer = player
