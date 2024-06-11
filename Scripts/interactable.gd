extends Node2D

# Handles area detection for when player accesses a scene change, i.e. the forge
var canInteract := false
@export_file var transitionScene = "res://Scenes/main.tscn"
@onready var interactButton = $KeyboardE
@onready var eToInteractLabel = $"E to Interact"
	
func _process(_delta):
	if Input.is_action_just_pressed("interact") and canInteract:
		get_tree().change_scene_to_file(transitionScene)

func _on_area_2d_area_entered(area):
	if area.is_in_group("Player"):
		interactButton.show()
		eToInteractLabel.show()
		canInteract = true

func _on_area_2d_area_exited(_area):
	interactButton.hide()
	eToInteractLabel.hide()
	canInteract = false
