extends KinematicBody2D

const UP = Vector2(0, -1)
var double_jump_ready = false
var motion = Vector2()
var speed = 200
var gravity = 30
var jump_force = -400

func _physics_process(delta):
	motion.y += gravity
	if Input.is_action_pressed('ui_right'):
		motion.x = speed
	elif Input.is_action_pressed('ui_left'):
		motion.x = -speed
	else:
		motion.x = 0
	
	if is_on_floor():
		double_jump_ready = true
		if Input.is_action_just_pressed('ui_up'):
			motion.y = jump_force
	elif double_jump_ready:
		if Input.is_action_just_pressed('ui_up'):
			motion.y = jump_force
			double_jump_ready = false
			
	motion = move_and_slide(motion, UP)