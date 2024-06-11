extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -200.0

@onready var inventoryUI = $"Inventory UI"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	GlobalPlayerManager.setPlayerReference(self)

func _physics_process(delta):
	movePlayer(delta)
	handleForgeInput()

func movePlayer(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func handleForgeInput():
	if Input.is_action_just_pressed("forge"):
		print("Clang!")

func _input(event):
	if event.is_action_pressed("inventory"):
		inventoryUI.visible = !inventoryUI.visible
		get_tree().paused = !get_tree().paused
