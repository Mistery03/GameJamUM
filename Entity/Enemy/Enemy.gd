class_name Enemy
extends Entity

@onready var animation = $Animation
@export var enemyAttack: int = 10
@onready var state_machine = $StateMachine
@onready var detectPlayer = $RayCast2D
@onready var attackPlayer = $Attack



# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine.initEntity(self,animation)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	

	
	
