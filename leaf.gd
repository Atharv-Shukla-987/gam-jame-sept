extends Area2D

var spd = 100.0
var drag = false

func _ready():
	input_event.connect(_on_input_event)
	modulate = [Color(0.974, 0.518, 0.214, 1.0), Color(0.589, 0.24, 0.11, 1.0), Color(1, 0.85, 0)].pick_random()
	spd = randf_range(50, 110)

func _process(delta):
	if drag:
		global_position = get_global_mouse_position()
		if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			drag= false
			check_drop()
	else:
		global_position.y += spd * delta
		if global_position.y > get_viewport_rect().size.y + 50:
			
			queue_free()

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		drag = true

func check_drop():
	var trunk = get_tree().get_first_node_in_group("trunk_target")
	if trunk and trunk.leafinside(self):
		Gamemanager.add_score(1)
		queue_free()
