extends KinematicBody2D

export var speed = 50
var screenSize = Vector2.ZERO

func _ready():
	screenSize = get_viewport_rect().size

func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	direction = direction.normalized()
	
	if direction != Vector2.ZERO:
		direction += direction * speed * delta
	else:
		direction = direction.move_toward(Vector2.ZERO, delta)
	move_and_slide(direction)

	position += direction * speed * delta
	#position.x = clamp(position.x,0,screenSize.x)
	#position.y = clamp(position.y,0,screenSize.y)
	
	#if direction.x != 0:
		#$AnimatedSprite.animation = "right"
		#$AnimatedSprite.flip_h = direction.x < 0
		#$AnimatedSprite.flip_v = false
	#elif direction.y != 0:
		#AnimatedSprite.animation = "up"
		#$AnimatedSprite.flip_v = direction.y > 0
