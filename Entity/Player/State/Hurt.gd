class_name Hurt
extends State


@export var enemyHP : int = 100
@export var died_state: State
@export var move_state:State
@export var chase_state:State
@export var damage:float

var prevState:State

func enter() -> void:
	super()
	get_hit(self.damage)

func exit()->void:
	parent.isHit =false
	
func process_frame(delta: float) -> State:
	if parent.currHealth <=0:
		return died_state
	
	return prevState


func get_hit(damage: int):
	parent.currHealth -= damage
	parent.currHealth = max(parent.currHealth, 0) # Ensure health doesn't go negative
	
		
