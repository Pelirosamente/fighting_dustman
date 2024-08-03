extends Area2D



func _on_body_entered(body):
	if body.is_in_group("Player"):
		Global.points +=1
		queue_free()

