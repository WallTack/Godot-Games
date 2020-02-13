extends KinematicBody2D

onready var ANIMS = get_node('Animations')
onready var STEP_AUDIO = get_node('Footsteps')

var motion = Vector2()
var speed = 200
var current_anim = 'idle'
var facing_left = false
var actions = []

func _physics_process(delta):
	actions = [Input.is_action_pressed('ui_left'), Input.is_action_pressed('ui_right'), 
			   Input.is_action_pressed('ui_up'), Input.is_action_pressed('ui_down')]
	if actions[0] and actions[1]:
		motion.x = 0
		if not actions[2] and not actions[3]:
			current_anim = 'idle'
		elif actions[2] and actions[3]:
			current_anim = 'idle'
	elif actions[1]:
		motion.x = speed
		current_anim = 'running'
		facing_left = false
	elif actions[0]:
		motion.x = -speed
		current_anim = 'running'
		facing_left = true
	else:
		motion.x = 0
		
	if ANIMS.is_flipped_h() != facing_left:
		ANIMS.set_flip_h(facing_left)
	
	if actions[2] and actions[3]:
		current_anim = 'running'
		motion.y = 0
	elif actions[2]:
		current_anim = 'running'
		motion.y = -speed
	elif actions[3]:
		current_anim = 'running'
		motion.y = speed
	else:
		motion.y = 0
		if not actions[0] and not actions[1]:
			current_anim = 'idle'
		
	if ANIMS.get_animation() != current_anim:
		ANIMS.play(current_anim)
	
	move_and_slide(motion)
	if motion.x != 0 or motion.y != 0:
		if not STEP_AUDIO.is_playing():
			STEP_AUDIO.play()