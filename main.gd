extends Node2D

var slot1 = Deck.slot3
var slot2 = Deck.slot3
var slot3 = Deck.slot3


func _ready():
	randomize()
	Deck.cards.shuffle()
	print(Deck.cards)
	if slot1 == "empty":
		var card = Deck.cards[0].instance()
		card.global_position = Vector2(489,826)
		add_child(card)
		Deck.cards.pop_front()
		
	if slot2 == "empty":
		var card = Deck.cards[0].instance()
		card.global_position = Vector2(951,826)
		add_child(card)
		Deck.cards.pop_front()
		
	if slot3 == "empty":
		var card = Deck.cards[0].instance()
		card.global_position = Vector2(1413,826)
		add_child(card)
		Deck.cards.pop_front()
	
func _process(delta):
	$player_hp.value=Global.player_hp
	$RichTextLabel.text=str(Global.move)
	$RichTextLabel2.text=str(Global.e_move)
	#if Deck.cards.size() > 0:
		#refill()
		
func refill():
	if slot1 == "empty":
		var card = Deck.cards[0].instance()
		card.global_position = Vector2(489,826)
		add_child(card)
		Deck.cards.pop_front()
		
	if slot2 == "empty":
		var card = Deck.cards[0].instance()
		card.global_position = Vector2(951,826)
		add_child(card)
		Deck.cards.pop_front()
		
	if slot3 == "empty":
		var card = Deck.cards[0].instance()
		card.global_position = Vector2(1413,826)
		add_child(card)
		Deck.cards.pop_front()
		
		
func _on_slot1_area_entered(area):
	Deck.slot1 = area.name


func _on_slot2_area_entered(area):
	Deck.slot2 = area.name


func _on_slot3_area_entered(area):
	Deck.slot3 = area.name


func _on_slot1_area_exited(area):
	if Deck.cards.size() > 0:
		var card = Deck.cards[0].instance()
		card.global_position = Vector2(489,826)
		yield(get_tree().create_timer(1),"timeout")
		add_child(card)
		Deck.cards.pop_front()


func _on_slot2_area_exited(area):
	if Deck.cards.size() > 0:
		var card = Deck.cards[0].instance()
		card.global_position = Vector2(951,826)
		yield(get_tree().create_timer(1),"timeout")
		add_child(card)
		Deck.cards.pop_front()


func _on_slot3_area_exited(area):
	if Deck.cards.size() > 0:
		var card = Deck.cards[0].instance()
		card.global_position = Vector2(1413,826)
		yield(get_tree().create_timer(1),"timeout")
		add_child(card)
		Deck.cards.pop_front()
