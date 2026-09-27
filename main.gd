extends Node2D


@onready var sprite_2d: Sprite2D = $Sprite2D

@export var bg :Array[Texture2D] = []

func _ready() -> void:
	sprite_2d.texture = bg.pick_random()
	var viewportsize = get_viewport_rect().size
	sprite_2d.position=viewportsize /2
	sprite_2d.scale = viewportsize / sprite_2d.texture.get_size()
