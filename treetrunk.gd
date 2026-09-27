extends Area2D



func _ready() -> void:
	add_to_group("trunk_target")
	
func leafinside(leaf) -> bool:
	return get_overlapping_areas().has(leaf)


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("leaf"):
		Gamemanager.add_score(1)
		area.queue_free()
