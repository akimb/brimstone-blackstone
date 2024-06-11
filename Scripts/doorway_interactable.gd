extends Node2D

var canInteract := false
@export_file var transitionScene = "res://Scenes/main.tscn"
#@onready var interactButton = $KeyboardE
#@onready var eToInteractLabel = $"E to Interact"
	
#func _process(delta):
#	if Input.is_action_just_pressed("interact") and canInteract:
#		get_tree().change_scene_to_packed(transitionScene)

func _on_area_2d_area_entered(area):
	if area.is_in_group("Player"):
		get_tree().change_scene_to_file(transitionScene)
		SignalBus.transitionToMain.emit() # how do I transition the player to be in front of the door? 
