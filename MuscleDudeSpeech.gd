extends PopupDialog

onready var TEXT = get_node('MuscleDudeText')

func _ready():
	popup(Rect2(460, 200, 155, 45))
	