extends CharacterBody2D

var bullet1 = preload("res://scene/bullet.tscn")
#export (PackedScene) var bullet
#@export var bullet :PackedScene 

var player = null
var canshoot = true

@onready var spawnpos = $Spawnpos

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body


func _on_shootspeed_timeout():
	canshoot = true
	if player != null:
		shoot()

func shoot():
	if canshoot:
		var bullet = bullet1.instantiate()
		bullet.position = spawnpos.global_position
		get_parent().add_child(bullet)
		
		$Shootspeed.start()
		canshoot = false
		
