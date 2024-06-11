extends Area2D

class_name Pickup

@onready var collisionShape : CollisionShape2D = $CollisionShape2D

var launchVelocity : Vector2 = Vector2.ZERO
var moveDuration : float = 0
var itemInstantiateTime : float = 0.5
var timeSinceLaunch : float = 0
var timeSinceItemSpawn : float = 0
var moveSpeed : float = 5.0
var launching : bool = false #:
#	set(isLaunching):
#		launching = isLaunching
#		collisionShape.disabled = launching
@onready var player = get_parent().get_node("Player")

func _process(delta):
	if launching:
		position += launchVelocity * delta
		timeSinceLaunch += delta
		
		if timeSinceLaunch >= moveDuration:
			launching = false
	else:
		timeSinceItemSpawn += delta
	
	if timeSinceItemSpawn >= itemInstantiateTime:
		moveToPlayer(delta)

func launchItem(velocity : Vector2, duration : float):
	launchVelocity = velocity
	moveDuration = duration
	timeSinceLaunch = 0
	launching = true

func moveToPlayer(delta):
	position += (player.position - position) * moveSpeed * delta

func _on_area_entered(area):
	if area.is_in_group("Player"):
		GameSounds.play("res://Sounds/POP.mp3")
		queue_free()
