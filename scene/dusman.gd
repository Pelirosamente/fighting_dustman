extends CharacterBody2D


const SPEED = 170.0
const JUMP_VELOCITY = -315.0
var health = 3


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var sprite = $AnimatedSprite2D
@onready var dmg_animation = $flash

func _physics_process(delta):
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


func player_hit():
	health -= 1 
	dmg_animation.play("flash")
	Global.health -=1
	if health == 0:
		queue_free()
