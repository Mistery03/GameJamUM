class_name Damage
extends State


@export var enemyHP : int = 100
@export var died: State
@export var move_state:State
@export var chase_state:State

var prevState:State

func enter() -> void:
	super()
	get_hit(1)
	print(enemyHP)

func exit()->void:
	parent.isHit =false
	
func process_frame(delta: float) -> State:
	if enemyHP<=0:
		return died
	return prevState


func get_hit(damage: int):
	enemyHP -= damage
	enemyHP = max(enemyHP, 0) # Ensure health doesn't go negative
	
		
