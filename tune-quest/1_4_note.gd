
extends Node2D

@export var travel_time: float = 2.0

func _ready() -> void:
	await get_tree().process_frame
	var sara = get_tree().get_first_node_in_group("player")
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	tween.tween_property(self, "global_position", sara.global_position, travel_time)
	tween.tween_callback(queue_free)
