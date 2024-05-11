class_name Platform
extends Node


@export var animation:AnimationPlayer
@export var animationName:String
@export var isAutoplay:bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if isAutoplay:
		animation.play(animationName)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ACTION"):
			animation.play(animationName)
