extends Area2D


\
func _ready() -> void:
	add_to_group("trunk_target")
	
func leafinside(leaf) -> bool:
	return get_overlapping_areas().has(leaf)
