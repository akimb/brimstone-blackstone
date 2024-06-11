extends Control

@onready var gridContainer = $GridContainer

func _ready():
	SignalBus.updateInventory.connect(_onInventoryUpdated)
#	GlobalPlayerManager.updateInventory.connect(_onInventoryUpdated)
	_onInventoryUpdated()

func _onInventoryUpdated(): # this is a 'connector' function
	clearGridContainer()
	for item in GlobalPlayerManager.inventory:
		var slot = GlobalPlayerManager.inventorySlots.instantiate()
		gridContainer.add_child(slot)
		if item != null:
			slot.set_item(item)
		else: 
			slot.set_empty()
	
func clearGridContainer():
	while gridContainer.get_child_count() > 0:
		var child = gridContainer.get_child(0)
		gridContainer.remove_child(child)
		child.queue_free()
