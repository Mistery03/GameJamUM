extends Node2D

@export var whom:String
@export var texture:Texture2D
@export_file("*.tscn") var scenePath
@onready var prompt_action = $promptAction
@export var promptMessage:String
@onready var sprite = $Sprite

var isPlayerWithin:bool
var body:Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	prompt_action.text = whom + promptMessage + "\n[E]"
	sprite.texture = texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	if body:
		if event is InputEventKey:
			if event.is_action_pressed("INTERACT"):
				get_tree().change_scene_to_file(scenePath)



func _on_area_2d_mouse_entered():
	prompt_action.visible = true


func _on_area_2d_mouse_exited():
	prompt_action.visible = false


func _on_area_2d_body_entered(body):
	self.body = body
	isPlayerWithin = true
	prompt_action.visible = true


func _on_area_2d_body_exited(body):
	self.body = body
	isPlayerWithin = false
	prompt_action.visible = false
