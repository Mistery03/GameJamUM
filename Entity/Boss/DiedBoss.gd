class_name DiedBoss
extends State

@export var enemyHP : int = 100

func enter() -> void:
	super()
	await get_tree().create_timer(1).timeout
	Dialogic.start("Dialogue6")
	parent.queue_free()

func chase_player(delta: float, direction: int)->void:
	parent.queue_free()
