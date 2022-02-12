extends Control

func show_labels():
	get_tree().paused = true
	show()
	$Timer.start()

func _on_Timer_timeout():
	get_tree().paused = false
	hide()
