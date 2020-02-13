extends KinematicBody2D

onready var ANIMS = get_node('Animations')

var double_jump_ready = false
var motion = Vector2()
var speed = 200
var current_anim = 'idle'
var moving_x = false
var facing_left = false

func _physics_process(delta):
	if Input.is_action_pressed('ui_right'):
		motion.x = speed
		current_anim = 'running'
		moving_x = true
		facing_left = false
	elif Input.is_action_pressed('ui_left'):
		motion.x = -speed
		current_anim = 'running'
		moving_x = true
		facing_left = true
	else:
		moving_x = false
		motion.x = 0
		
	if ANIMS.is_flipped_h() != facing_left:
		ANIMS.set_flip_h(facing_left)
		
	if Input.is_action_pressed('ui_up'):
		current_anim = 'running'
		motion.y = -speed
	elif Input.is_action_pressed('ui_down'):
		current_anim = 'running'
		motion.y = speed
	else:
		motion.y = 0
		if not moving_x:
			current_anim = 'idle'
		
	if ANIMS.get_animation() != current_anim:
		ANIMS.play(current_anim)
			
	move_and_slide(motion)