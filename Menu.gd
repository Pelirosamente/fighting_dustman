extends Control



func _on_play_pressed():
	$click.play()
	$Timer.start()
	


func _on_quit_pressed():
	get_tree().quit()


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scene/fighting dustman.tscn")
