extends Control

func _on_buttonPause_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		$efecto.interpolate_property($buttons,"rect_position",$buttons.rect_position,$buttons.rect_position-Vector2(1025,0),1,Tween.TRANS_BACK)
		$efecto.start()
	else:
		get_tree().paused = true
		$efecto.interpolate_property($buttons,"rect_position",$buttons.rect_position,$buttons.rect_position+Vector2(1025,0),1,Tween.TRANS_BACK)
		$efecto.start()

func _on_buttonExit_pressed():
	get_tree().quit()

func _on_buttonContinue_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		$efecto.interpolate_property($buttons,"rect_position",$buttons.rect_position,$buttons.rect_position-Vector2(1025,0),1,Tween.TRANS_BACK)
		$efecto.start()

func _on_buttonInicio_pressed():
	get_tree().change_scene("res://escenas/menu.tscn")
