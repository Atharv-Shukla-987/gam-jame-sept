extends Sprite2D

@export var small: Texture2D
@export var medium: Texture2D
@export var big: Texture2D

func _ready():
	texture = small
	Gamemanager.score_changed.connect(update_tree)

func update_tree():
	if Gamemanager.score >= 15:
		texture = big
	elif Gamemanager.score >= 6:
		texture = medium
	else:
		texture = small
