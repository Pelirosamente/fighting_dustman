extends Area2D

signal pointscollect2

func _on_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("pointscollect2")
		$collect1.play()
		$Timer.start()


func _on_timer_timeout():
	queue_free()
