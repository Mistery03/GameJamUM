extends Node2D

@onready var player = $Player
@onready var doctor = $Doctor

@export var dialogueName:String 

# Called when the node enters the scene tree for the first time.
func _ready():
	player.camera.enabled = false
	doctor.dialogueName = dialogueName

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
