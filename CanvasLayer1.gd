extends CanvasLayer

var time = Global.speedrun_timer
var health = Global.health
var points = Global.points

func _ready():
	time = 0

func update_ui():
	var formatted_time = str(time)
	var decinal_index = formatted_time.find(".")
	
	if decinal_index > 0:
		formatted_time = formatted_time.left(decinal_index + 3) #take only two deci
		
	Global.speedrun_timer = formatted_time
	$Label.text = formatted_time


func _process(delta):
	time = float(time) + delta
	update_ui()
	if points == 16:
		stop()
	


func stop() -> void:
	set_process(false)


