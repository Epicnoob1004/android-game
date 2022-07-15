extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



func _on_yes_pressed():
	Deck.magic_conformation = true
	queue_free()
func _on_no_pressed():
	Deck.magic_conformation = false
	queue_free()
