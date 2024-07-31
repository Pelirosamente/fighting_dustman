extends SubViewport

@onready var camera = $Camera2D
var dustman = load("res://scene/dusman.tscn")


func _physics_process(_delta):
	camera.position = owner.find_child("dustman").position
	
	
