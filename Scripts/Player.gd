extends CharacterBody2D

class_name Player

@export var speed := 100.0
@onready var animationTree = $"Animation Tree"
@onready var inventoryUI = $"Inventory UI"
@onready var hand_equip = $"Hand Equip"

var direction : Vector2 = Vector2.ZERO

func _ready():
	GlobalPlayerManager.setPlayerReference(self)
	animationTree.active = true

func _process(_delta):
	updateAnimParams()
	
func _physics_process(delta):
	movePlayer(delta)

func movePlayer(_delta):
	direction = Input.get_vector("left", "right", "forward", "backward").normalized()
	velocity = direction * speed
	move_and_slide()

func _input(event):
	if event.is_action_pressed("inventory"):
		inventoryUI.visible = !inventoryUI.visible
		get_tree().paused = !get_tree().paused

# Does fuckshit with the animation tree. Damn if using this is complicated af. 
func updateAnimParams():
	if velocity == Vector2.ZERO:
		animationTree["parameters/conditions/idle"] = true
		animationTree["parameters/conditions/is_moving"] = false
	else:
		animationTree["parameters/conditions/idle"] = false
		animationTree["parameters/conditions/is_moving"] = true
		
	if Input.is_action_just_pressed("attack") or Input.is_action_pressed("attack"):
		animationTree["parameters/conditions/swing"] = true
	else:
		animationTree["parameters/conditions/swing"] = false
		
	if(direction != Vector2.ZERO):
		animationTree["parameters/Idle/blend_position"] = direction
		animationTree["parameters/Swing/blend_position"] = direction
		animationTree["parameters/Walk/blend_position"] = direction

# Signals that handle hiding of tool while Player is moving, until they press the use button.
func _on_animation_tree_animation_started(_anim_name):
	if animationTree["parameters/conditions/swing"] == true:
		hand_equip.show()

func _on_animation_tree_animation_finished(_anim_name):
	if animationTree["parameters/conditions/swing"] == false:
		hand_equip.hide()

