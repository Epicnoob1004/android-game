extends Node
var magic = preload("res://assets/cards/magic.tscn")
var counter = preload("res://assets/cards/counter.tscn")
var protection = preload("res://assets/cards/protection.tscn")
var cards=[magic,magic,magic,counter,counter,counter,protection,protection,protection]
var magic_popup = preload("res://assets/popups/magic_popup.tscn")
var protection_popup = preload("res://assets/popups/protection_popup.tscn")
var counter_popup = preload("res://assets/popups/counter_popup.tscn")
var slot1="empty"
var slot2="empty"
var slot3 ="empty"
var magic_conformation
var protection_conformation
var counter_conformation
func _process(delta):
	if cards.size() > 9:
		print("thats to much cards")
		
