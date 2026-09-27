extends Node2D


@onready var sprite_2d: Sprite2D = $Sprite2D

@export var bg :Array[Texture2D] = []

func _ready() -> void:
	sprite_2d.texture = bg.pick_random()
	var viewportsize = get_viewport_rect().size
	sprite_2d.position=viewportsize /2
	sprite_2d.scale = viewportsize / sprite_2d.texture.get_size()
	Gamemanager.score_changed.connect(update_score_label)
	update_score_label()
	
func update_score_label():
	$CanvasGroup/score.text = "Leaves: %d" % Gamemanager.score

func _on_leaf_spawner_timeout() -> void:
	var leaf = preload("res://leaf.tscn").instantiate()
	leaf.position = Vector2(randf_range(50, get_viewport_rect().size.x - 50), -30)
	add_child(leaf)



func _on_leafspaner_timeout() -> void:
	var leaf = preload("res://leaf.tscn").instantiate()
	leaf.position = Vector2(randf_range(50,get_viewport_rect().size.x -50),-30)
	add_child(leaf)
