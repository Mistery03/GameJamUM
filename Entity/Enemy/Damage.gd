class_name Damage
extends Node

@export var enemyHP : int = 100

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_hit(20)

func get_hit(damage: int):
	enemyHP -= damage
	enemyHP = max(enemyHP, 0) # Ensure health doesn't go negative
	print("damaging")

	if enemyHP <= 0:
		print("Im died")
		get_parent().queue_free()
