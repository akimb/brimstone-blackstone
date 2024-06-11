@tool
extends Node2D

@export var itemQuantity = 1
@export var itemName = ""
@export var itemType = ""
@export var itemTexture : Texture
@export var itemEffect = ""

@export var toggleGravity = false
var scenePath : String = "res://Scenes/inventory_item.tscn"

@onready var itemSprite = $RigidBody2D/Sprite2D
@onready var itemGravity = $RigidBody2D

var playerIsInRange = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if toggleGravity:
		itemGravity.gravity_scale = 1
	if not Engine.is_editor_hint():
		itemSprite.texture = itemTexture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Engine.is_editor_hint():
		itemSprite.texture = itemTexture
	
	if playerIsInRange:
		pickupItem()
		playerIsInRange = false

func pickupItem():
	var item = {
		"quantity" : itemQuantity,
		"type" : itemType,
		"name" : itemName,
		"texture" : itemTexture,
		"effect" : itemEffect,
		"scenepath" : scenePath
	}
	
	if GlobalPlayerManager.referencePlayer:
		GlobalPlayerManager.addItemToInventory(item)
		self.queue_free()

func _on_area_2d_area_entered(area):
	if area.is_in_group("Player"):
		playerIsInRange = true
