extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var small: Texture2D
@export var medium: Texture2D
@export var big: Texture2D

func _ready():
	sprite_2d.texture = small
	Gamemanager.score_changed.connect(update_tree)

func update_tree():
	if Gamemanager.score >= 15:
		sprite_2d.texture = big
	elif Gamemanager.score >= 6:
		sprite_2d.texture = medium
	else:
		sprite_2d.texture = small
