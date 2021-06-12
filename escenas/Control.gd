extends Control

var tiempo = 120 
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
	if get_tree().paused == true:
		get_tree().paused = false
		$efecto.interpolate_property($buttons,"rect_position",$buttons.rect_position,$buttons.rect_position-Vector2(1025,0),1,Tween.TRANS_BACK)
		$efecto.start()
	get_tree().change_scene("res://escenas/menu.tscn")
	
	pass # Replace with function body.
func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = _format_minutes()


func _on_Timer_timeout():
	tiempo -= 1
	update_time()

func _format_minutes():
	var minutes = tiempo / 60
	var seconds = fmod(tiempo, 60)
	
	return "%02d:%02d" % [minutes, seconds]
	
