extends Label

var points = 0

func _ready():
	self.text = str(points)


func _on_bottle_1_pointscollect_1():
	points +=1
	_ready()
	if points == 15:
		$Timer.start()


func _on_bottle_2_pointscollect_2():
	points +=1
	_ready()
	if points == 15:
		$Timer.start()


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scene/menuwin.tscn")
