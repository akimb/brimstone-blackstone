extends StaticBody2D

class_name ResourceNode

@export var resourceTypes : Array[ResourceNodeType] # making this array so we can keep this dynamic, aka minable, choppable, etc. 
@export var resourceHealth : int = 6
@export var pickupType : PackedScene
@export var launchSpeed : float = 100
@export var launchDuration : float = 0.25

@onready var parentLevel = get_parent()

func harvest(amount : int):
	resourceHealth -= amount
	GameSounds.play("res://Sounds/MINE SOUND 1.mp3")
#	print("Resource Health: " + str(resourceHealth))
	if resourceHealth <= 0:
		GameSounds.play("res://Sounds/ROCK BREAK.mp3")
		spawnResource()
		queue_free()

func spawnResource():
	var pickupInstance : Pickup = pickupType.instantiate() as Pickup
	parentLevel.call_deferred("add_child",pickupInstance)
#	parentLevel.add_child(pickupInstance)
	pickupInstance.position = position
	
	var direction : Vector2 = Vector2(
		randf_range(-1.0,1.0),
		randf_range(-1.0,1.0)
	).normalized()
	
	pickupInstance.launchItem(direction * launchSpeed, launchDuration)

