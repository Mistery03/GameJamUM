class_name Dead
extends State


func enter() -> void:
	super()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file(parent.currentScene)

