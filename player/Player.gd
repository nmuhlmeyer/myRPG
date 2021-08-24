extends KinematicBody2D

var type
#var grid
onready var grid = get_parent()

var speed = 0
const MAX_SPEED = 400

var velocity = Vector2()
var direction = Vector2()

var is_moving = false
var target_pos = Vector2()
var target_direction = Vector2()

func _ready():
	#grid = get_parent()
	print(grid)
	type = grid.PLAYER
	set_physics_process(true)

func _physics_process(delta):
	direction = Vector2()
	#var is_moving = Input.is_action_pressed('ui_up') or Input.is_action_pressed('ui_right') or Input.is_action_pressed('ui_down')  or Input.is_action_pressed('ui_left')
	
	#if is_moving:
		#speed = MAX_SPEED
		
	if Input.is_action_pressed('ui_up'):
		direction.y = -1
	elif Input.is_action_pressed('ui_down'):
		direction.y = 1
	if Input.is_action_pressed('ui_left'):
		direction.x = -1
	elif Input.is_action_pressed('ui_right'):
		direction.x = 1
	
	if direction != Vector2():
		speed = MAX_SPEED
	else:
		speed = 0
	
	if not is_moving and direction != Vector2():
		target_direction = direction
		if grid.is_vacant(get_position(), target_direction):
			target_pos = grid.update_child_pos(self)
			is_moving = true
	elif is_moving:
		speed = MAX_SPEED
		velocity = speed * target_direction * delta
		#move(velocity)
		pass
	#var target_pos = grid.update_child_pos(self)
	#set_position(target_pos)
	
	#new_obstacle.set_pos(map_to_world(pos))" by "new_obstacle.position = map_to_world(pos)"

	#velocity = speed * direction.normalized() * delta
	#move(velocity)
