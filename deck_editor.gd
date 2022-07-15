extends Node2D

var magic=3
var protection=3
var counter=3
var deck_completed=false

func _ready():
	Deck.cards.clear()

func _process(delta):
	$magic/Label.text=str(magic)
	$protection/Label.text=str(protection)
	$counter/Label.text=str(counter)
	if magic+protection+counter==9:
		deck_completed=true
		$Label.text="your all good"
	elif  magic+protection+counter>9:
		deck_completed=false
		$Label.text="to many cards"
	elif  magic+protection+counter<9:
		deck_completed=false
		$Label.text="not enough cards"
func _on_magic_l_pressed():
	magic-=1


func _on_magic_r_pressed():
	magic+=1


func _on_protection_l_pressed():
	protection-=1


func _on_protection_r_pressed():
	protection+=1


func _on_counter_l_pressed():
	counter-=1


func _on_counter_r_pressed():
	counter+=1


func _on_TouchScreenButton_pressed():
	if deck_completed==true:
		for i in magic :
			Deck.cards.append(Deck.magic)
		for i in protection :
			Deck.cards.append(Deck.protection)
		for i in counter :
			Deck.cards.append(Deck.counter)
		get_tree().change_scene("res://main.tscn")
