extends KinematicBody2D

var moving = false

func move_hint(direction):
	if direction == 'right':
		set_position(lerp(get_position(), ))

#func _on_Detector1_area_exited(area): 
#	moving = true
#
#
#func _on_Detector1_area_entered(area):
#	if get_parent().motion.x > 0:
#		var next_area = area.get_parent().get_child(area.get_index() + 1)
#		if is_instance_valid(next_area):
#			move_stop = false
#			print(next_area.get_overlapping_areas())
#		else:
#			move_stop = true
#	elif get_parent().motion.x < 0:
#		var next_area = area.get_parent().get_child(area.get_index() - 1)
#	elif get_parent().motion.y > 0:
#		var next_area = area.get_parent().get_child(area.get_index() - 1)
#	elif get_parent().motion.y < 0:
#		var next_area = area.get_parent().get_child(area.get_index() - 1)
