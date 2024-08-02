extends Area2D
var speed = 180
@onready var kill_time = $killtime

func _ready() -> void:
	kill_time.start()

func _physics_process(delta):
	position.x += delta * speed


func _on_killtime_timeout():
	queue_free() # for dissapear bullet


func _on_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit()
		queue_free()
