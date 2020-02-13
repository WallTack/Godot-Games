extends PopupDialog

onready var TEXT = get_node('Text')
onready var AUDIO = get_node('TextAudio')
onready var BUTTONS = get_node('../Buttons')

func _on_PlayerDetection_body_entered(body):
	if body.get_name() == 'Player':
		popup(Rect2(460, 200, 155, 45))
		
		if not AUDIO.is_playing() and len(TEXT.get_text()) != TEXT.get_visible_characters():
			AUDIO.play()

func _on_AudioStreamPlayer2D_finished():
	if len(TEXT.get_text()) != TEXT.get_visible_characters():
		TEXT.set_visible_characters(TEXT.get_visible_characters() + 1)
		if AUDIO.get_pitch_scale() == 0.6:
			AUDIO.set_pitch_scale(0.5)
		else:
			AUDIO.set_pitch_scale(0.6)
		AUDIO.play()
	else:
		if BUTTONS.get_children()[0].disabled == true:
			BUTTONS.get_children()[1].disabled = false
			BUTTONS.get_children()[0].disabled = true
		else:
			BUTTONS.get_children()[2].hide()
			BUTTONS.popup(Rect2(580, 250, 177, 58))


func _on_Response1_pressed():
	TEXT.set_visible_characters(4)
	TEXT.set_text('    Answer question.')
	for btn in BUTTONS.get_children():
		btn.disabled = true
	BUTTONS.get_children()[0].set_text('Blood-soiled ostrich.')
	BUTTONS.get_children()[1].set_text("Fuck you.  [ Fight ]")
	BUTTONS.get_children()[2].show()
	AUDIO.play()
