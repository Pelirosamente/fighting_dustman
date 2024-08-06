extends Control



func _on_playagain_pressed():
	get_tree().change_scene_to_file("res://scene/menu.tscn")


func _on_quit_pressed():
	queue_free()
