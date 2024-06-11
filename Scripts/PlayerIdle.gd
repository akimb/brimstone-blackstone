#extends State
#
#class_name PlayerIdle
#
##@export var walk_state : State
#@export var playerAnim : AnimatedSprite2D
#var player : CharacterBody2D
#
##func _ready():
##	player = get_tree().get_first_node_in_group("Player")
##	print(player.direction)
#
#func Enter():
#	player = get_tree().get_first_node_in_group("Player")
##	lastKnownDirection(player.direction)
##	playerAnim.play("Idle Side")
##	pass
#
#func PhysicsUpdate(delta):	
#	print(player.direction)
#	if player.direction > Vector2(0,0) or player.direction < Vector2(0,0):
#		state_transition.emit(self,"Walk")
#
#	if player.attack:
#		state_transition.emit(self,"Attack")
