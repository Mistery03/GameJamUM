extends Node2D

@onready var tile_map = $TileMap
@onready var player = $Player
@onready var priest = $Priest

@export var dialogueName:String 



var map_limits = tile_map
var map_cellsize = Vector2(32,32)
var playerPrevPos:Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	map_limits = tile_map.get_used_rect()
	priest.dialogueName = dialogueName


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouseTilePos = tile_map.local_to_map(player.mousePos)
	set_camera_limits()
	if player.position.x <= map_limits.position.x :
		player.position.x = playerPrevPos.x
	if player.position.x > map_limits.end.x * map_cellsize.x:
		player.position.x = playerPrevPos.x
	
	playerPrevPos = player.position
	
	var teleportData:TileData = tile_map.get_cell_tile_data(3,mouseTilePos)
	
	if teleportData:
		var isTeleportable = teleportData.get_custom_data("isTeleportable")
		if isTeleportable:
			if Input.is_action_just_pressed("ACTION"):
				player.position = tile_map.map_to_local(mouseTilePos)

func set_camera_limits():
	
	player.camera.limit_left = map_limits.position.x * map_cellsize.x
	player.camera.limit_right = map_limits.end.x * map_cellsize.x
	player.camera.limit_top = map_limits.position.y * map_cellsize.y
	player.camera.limit_bottom = map_limits.end.y * map_cellsize.y

