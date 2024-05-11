extends CharacterBody2D




var dialogueName:String


func _on_interact_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouse:
		if event.is_action_pressed("ACTION"):
			Dialogic.start(dialogueName)
