extends Node

@export var timelineName:String

var body:Node2D
@onready var prompt_action = $promptAction




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event: InputEvent) -> void:
	if body:
		if event is InputEventKey:
			if event.is_action_pressed("INTERACT"):
				Dialogic.start(timelineName)


func _on_interact_area_body_entered(body):
	self.body = body
	prompt_action.visible = true


func _on_interact_area_body_exited(body):
	prompt_action.visible = false
