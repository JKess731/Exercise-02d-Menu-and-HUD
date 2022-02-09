extends Control


func _ready():
	hide()

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		if not visible:
			show()
			get_tree().paused = true
		else:
			get_tree().pasued = false
			hide()
		

func _on_Quit_pressed():
	Global.reset()
	var _scene = get_tree().change_scene("res://Game.tscn")


func _on_Restart_pressed():
	get_tree().quit()
