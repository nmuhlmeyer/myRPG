extends KinematicBody2D

export var speed = 50
var screenSize = Vector2.ZERO

func _ready():
	screenSize = get_viewport_rect().size

func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("moveRight") - Input.get_action_strength("moveLeft")
	direction.y = Input.get_action_strength("moveDown") - Input.get_action_strength("moveUp")
	direction = direction.normalized()
	
	if direction != Vector2.ZERO:
		direction += direction * speed * delta
		#direction = direction.move_toward(direction * speed * delta)
	else:
		direction = direction.move_toward(Vector2.ZERO, delta)
		#direction = direction.move_toward(Vector2.ZERO, delta)
	move_and_collide(direction)
	#if Input.is_action_pressed("moveRight"):
		#direction.x += 1
	#if Input.is_action_pressed("moveLeft"):
		#direction.x -= 1
	#if Input.is_action_pressed("moveUp"):
		#direction.y -= 1
	#if Input.is_action_pressed("moveDown"):
		#direction.y += 1
	
	#if direction.length() > 0:
		#direction = direction.normalized()
		#$AnimatedSprite.play() #get_node("AnimatedSprite").play()
	#else:
		#$AnimatedSprite.stop()
	
	position += direction * speed * delta
	#position.x = clamp(position.x,0,screenSize.x)
	#position.y = clamp(position.y,0,screenSize.y)
	
	if direction.x != 0:
		#$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_h = direction.x < 0
		$AnimatedSprite.flip_v = false
	elif direction.y != 0:
		#AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = direction.y > 0
	
	#move_and_slide(speed * delta)s
	#move_and_slide(Vector2.ZERO, speed*delta)
	
	#move_and_slide(direction, Vector2(0,0),false, 4, 0.785, false)
	#for index in get_slide_count():
		#var collision = get_slide_collision(index)
