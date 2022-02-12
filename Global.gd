extends Node

var VP = Vector2.ZERO

var score = 0
var time = 100
var lives = 5

var level = 0
var levels = [
	{
		"level": 1,
		"title": "Level_1",
		"asteroids": [Vector2(100,100), Vector2(900,500)],
		"enemies": [Vector2(500,0)],
		"timer": 100,
		"asteroids_spawned": false,
		"enemies_spawned": false,
	},
]

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect('size_changed', self, "_resize")

func _physics_process(delta):
	var A = get_node_or_null("/root/Game/Asteroid_Container")
	var E = get_node_or_null("/root/Game/Enemy_Container")
	if A != null and E != null:
		var l = levels[level]
		if l["asteroids_spawned"] and A.get_child_count() == 0 and l["enemies_spawned"] and E.get_child_count() == 0:
			next_level()

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()
		
func _resize():
	VP = get_viewport().size
	
func reset():
	score = 0
	lives = 5
	level = 0
	for l in levels:
		l["asteroids_spawned"] = false
		l["enemies_spawned"] = false
	
func update_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()
		
func update_time(t):
	time += t
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_time()
		
func update_lives(l):
	lives += l
	if lives <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_lives()

func next_level():
	level += 1
	print(level)
	if level > levels.size():
		get_tree().change_scene("res://UI/End_Game.tscn")
	var levelLabel = get_node_or_null("/root/Game/UI/Level")
	if levelLabel != null:
		levelLabel.show_labels()
