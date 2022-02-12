extends Node2D

onready var Asteroid = load("res://Asteroid/Asteroid.tscn")

func _ready():
	if get_child_count() == 0 and Global.level < Global.levels.size():
		var level = Global.levels[Global.level]
		if level["asteroids_spawned"] == false:
			for pos in level["asteroids"]:
				var asteroid = Asteroid.instance()
				asteroid.position = pos
				add_child(asteroid)
				print('Asteroid Added for level ' + str(level))
			level["asteroids_spawned"] = true
