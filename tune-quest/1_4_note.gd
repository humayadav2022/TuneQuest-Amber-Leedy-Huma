

	
extends Node2D

@export var travel_time: float = 2.0

const KEY_TO_NOTE: Dictionary = {
	KEY_Q: "C#", KEY_W: "D#", KEY_E: "E#", KEY_R: "F#",
	KEY_I: "G#", KEY_O: "A#", KEY_P: "B#",
	KEY_A: "C", KEY_S: "D", KEY_D: "E", KEY_F: "F",
	KEY_J: "G", KEY_K: "A", KEY_L: "B",
	KEY_Z: "Cb", KEY_X: "Db", KEY_C: "Eb", KEY_V: "Fb",
	KEY_B: "Gb", KEY_N: "Ab", KEY_M: "Bb"
}

const PIANO_LAYOUT: Array[Dictionary] = [
	{"key": "A", "note": "C",  "type": "normal"},
	{"key": "Q", "note": "C#", "type": "sharp"},
	{"key": "Z", "note": "Cb", "type": "flat"},
	{"key": "S", "note": "D",  "type": "normal"},
	{"key": "W", "note": "D#", "type": "sharp"},
	{"key": "X", "note": "Db", "type": "flat"},
	{"key": "D", "note": "E",  "type": "normal"},
	{"key": "E", "note": "E#", "type": "sharp"},
	{"key": "C", "note": "Eb", "type": "flat"},
	{"key": "F", "note": "F",  "type": "normal"},
	{"key": "R", "note": "F#", "type": "sharp"},
	{"key": "V", "note": "Fb", "type": "flat"},
	{"key": "J", "note": "G",  "type": "normal"},
	{"key": "I", "note": "G#", "type": "sharp"},
	{"key": "B", "note": "Gb", "type": "flat"},
	{"key": "K", "note": "A",  "type": "normal"},
	{"key": "O", "note": "A#", "type": "sharp"},
	{"key": "N", "note": "Ab", "type": "flat"},
	{"key": "L", "note": "B",  "type": "normal"},
	{"key": "P", "note": "B#", "type": "sharp"},
	{"key": "M", "note": "Bb", "type": "flat"}
]

@onready var songs: Dictionary = {
	"wave_1": {
		# Add your wave 1 song data here
	}
}

func _ready() -> void:
	await get_tree().process_frame
	
	var sara = get_parent().get_node_or_null("Sara")
	

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	tween.tween_property(self, "global_position", sara.global_position, travel_time)
	tween.tween_callback(queue_free)
