@tool
extends Sprite2D

# Equipping code that handles modular switching of tools. Detects an area that is hit.
@export var equippedItem : EquippableItem :
	set(nextEquipped):
		equippedItem = nextEquipped
		self.texture = equippedItem.texture
#@export var toolDmgValue := 1

func _ready():
	self.hide()

func _on_area_2d_body_entered(body):
	if (equippedItem.has_method("interactWithBody")):
		equippedItem.interactWithBody(body)
#	if body.is_in_group("Resource"):
##		print("hit")
#		SignalBus.resourceHit.emit(toolDmgValue)
