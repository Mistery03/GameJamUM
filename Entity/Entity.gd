class_name Entity
extends CharacterBody2D

@export var maxHealth:float

var currHealth:float = 0
var currMana:float = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _moveToPos(pos:Vector2):
	pass
