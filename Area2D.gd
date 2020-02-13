extends Area2D

onready var POPUP = get_node('MuscleDudeSpeech')

signal body_entered()

func body_entered(x):
	print(x)