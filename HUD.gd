extends Control


func _ready():
	Global.update_score(0)
	Global.update_lives(0)
	Global.update_time(0)


func update_score():
	$Score.text = "Score: " + str(Global.score)
	
func update_lives(): 
	if Global.lives == 5:
		pass
	elif Global.lives == 4:
		$Hearts/Heart5.hide()
	elif Global.lives == 3:
		$Hearts/Heart5.hide()
		$Hearts/Heart4.hide()
	elif Global.lives == 2:
		$Hearts/Heart5.hide()
		$Hearts/Heart4.hide()
		$Hearts/Heart3.hide()
	elif Global.lives == 1:
		$Hearts/Heart5.hide()
		$Hearts/Heart4.hide()
		$Hearts/Heart3.hide()
		$Hearts/Heart2.hide()
	elif Global.lives == 0:
		$Hearts/Heart5.hide()
		$Hearts/Heart4.hide()
		$Hearts/Heart3.hide()
		$Hearts/Heart2.hide()
		$Hearts/Heart1.hide()

func update_time():
	$Time.text = "Time: " + str(Global.time)
