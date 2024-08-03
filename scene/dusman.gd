extends CharacterBody2D


const SPEED = 170.0
const JUMP_VELOCITY = -315.0
var health = 4
var alive = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var uded = preload("res://scene/menuded.tscn")


	
	
@onready var sprite = $AnimatedSprite2D
@onready var dmg_animation = $flash
@onready var dmg_animation1 = $visible


func _physics_process(delta):
	if alive:
			# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta

	# Handle jump.
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
		if is_on_floor() && direction != 0:
			sprite.play('walk')
		elif is_on_floor():
			sprite.play('stand')
		elif !is_on_floor():
			sprite.play('stand')
		
		move_and_slide()
	#else:
		#if Input.is_joy_button_pressed("")



func player_hit():
	health -= 1 
	dmg_animation.play("flash")
	dmg_animation1.play("visible")
	Global.health -=1
	if health == 0:
		queue_free()
		#alive = false
		#area.visible = true
		


func _on_area_2d_body_entered(_body):
	health -= 1 
	dmg_animation.play("flash")
	dmg_animation1.play("visible")
	Global.health -=1
	if health == 0:
		#alive = false
		queue_free()
		#area.visible = true
		

