extends Node

var score = 0
var hlt = 3
signal score_changed
signal health_changed

func add_score(amount):
	score += amount
	score_changed.emit()

func lose_health(amount = 1):
	hlt -= amount
	health_changed.emit()
	if hlt <= 0:
		get_tree().reload_current_scene()
