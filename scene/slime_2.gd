extends CharacterBody2D


var bullet2 = preload("res://bullet_2.tscn")
#export (PackedScene) var bullet
#@export var bullet :PackedScene 
@onready var spawnpos = $Spawnpos

var player = null
var canshoot = true

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func _on_shootspeed_timeout():
	canshoot = true
	if player != null:
		shoot()
		
func shoot():
	if canshoot:
		var bullet = bullet2.instantiate()
		bullet.position = spawnpos.global_position
		get_parent().add_child(bullet)
		
		$Shootspeed.start()
		canshoot = false

