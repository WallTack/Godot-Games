extends Node

var motion = Vector2()
var speed = 1000
var actions = []
var direction = 'None'

func _physics_process(delta):
	actions = [Input.is_action_just_pressed('ui_left'), Input.is_action_just_pressed('ui_right'), 
			   Input.is_action_just_pressed('ui_up'), Input.is_action_just_pressed('ui_down')]
	if actions[1]:
		direction = 'right'
		motion.x = speed
		motion.y = 0
	elif actions[0]:
		motion.x = -speed
		motion.y = 0
	elif actions[2]:
		motion.y = -speed
		motion.x = 0
	elif actions[3]:
		motion.y = speed
		motion.x = 0
	
	for box in get_children():
		box.move_hint(direction)

