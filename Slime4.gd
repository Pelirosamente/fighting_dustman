extends CharacterBody2D

var bullet4 = preload("res://scene/bullet_4.tscn")

var player = null
var canshoot = true
@onready var spawn = $spawn

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		


func _on_shoottime_timeout():
	canshoot = true
	if player != null:
		shoot()

func shoot():
	if canshoot:
		var bullet = bullet4.instantiate()
		bullet.position = spawn.global_position
		get_parent().add_child(bullet)
		
		$shoottime.start()
		canshoot = false
