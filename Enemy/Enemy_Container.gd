extends Node2D

onready var Enemy = load("res://Enemy/Enemy.tscn")

func _ready():
	if get_child_count() == 0:
		var current_level = Global.level
		var level = Global.levels[current_level]
		if not level["enemies_spawned"]:
			for pos in level["enemies"]:
				var enemy = Enemy.instance()
				enemy.position = pos
				add_child(enemy)
				print('Enemy Added from level ' + str(level["level"]))
			level["enemies_spawned"] = true
