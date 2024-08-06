extends Area2D

signal pointscollect2

func _on_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("pointscollect2")
		queue_free()
