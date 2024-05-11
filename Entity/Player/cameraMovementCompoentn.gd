class_name ICameraMoveComponent
extends Node

var axis:Vector2 = Vector2.ZERO

func get_movement_direction() -> Vector2:

	axis = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	return axis.normalized()
