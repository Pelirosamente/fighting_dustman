extends SubViewport

@onready var camera = $Camera2D
@onready var player = $"../../.."

func _physics_process(_delta):
	camera.position = player.position
