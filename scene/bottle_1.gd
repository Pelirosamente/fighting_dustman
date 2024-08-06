extends Area2D

signal pointscollect1

func _on_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("pointscollect1")
		queue_free()

