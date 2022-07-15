extends Node
var magic_card_num
var magic_card_num_rand = RandomNumberGenerator.new()
var protection_card_num
var protection_card_num_rand = RandomNumberGenerator.new()
var counter_card_num
var counter_card_num_rand = RandomNumberGenerator.new()
var extra_cards=RandomNumberGenerator.new()
var extra_card_num
var total
var deck = []
var completed=false
var state_of_deck ="start"
var enemy_hp=9
var magic = preload("res://assets/e_cards/e_magic.tscn")
var counter = preload("res://assets/e_cards/e_counter.tscn")
var protection = preload("res://assets/e_cards/e_protection.tscn")
var attack_types := {
	magic: Global.MoveType.MAGIC,
	protection: Global.MoveType.PROTECTION,
	counter: Global.MoveType.COUNTER
}
func _ready():
	state_of_deck ="start"
	magic_card_num_rand.randomize()
	protection_card_num_rand.randomize()
	counter_card_num_rand.randomize()
	extra_cards.randomize()
	magic_card_num=magic_card_num_rand.randi_range(0,9)
	protection_card_num=protection_card_num_rand.randi_range(0,9)
	counter_card_num=counter_card_num_rand.randi_range(0,9)
	extra_card_num=extra_cards.randi_range(1,3)
	total = magic_card_num+protection_card_num+counter_card_num
	print(total)

func _process(delta):
	attack()
	results()
	get_node("../enemy_hp").value=enemy_hp
	if completed==false:
		if magic_card_num < 1:
			magic_card_num=0
		if protection_card_num < 1:
			protection_card_num=0
		if counter_card_num <1:
			counter_card_num=0
		if total < 9:
			if extra_card_num == 1:
				magic_card_num +=1
				#print(magic_card_num)
				#print("less-magic")
			elif extra_card_num == 2:
				protection_card_num+=1
				#print(protection_card_num)
				#print("less-protection")
			elif extra_card_num == 3:
				counter_card_num+=1
				#print(counter_card_num)
				#print("less-counter")
			extra_card_num=extra_cards.randi_range(1,3)
			total = magic_card_num+protection_card_num+counter_card_num
		if total > 9:
			if extra_card_num == 1:
				if magic_card_num > 0:
					magic_card_num -=1
					#print(magic_card_num)
					#print("greater-magic")
			elif extra_card_num == 2:
				if protection_card_num > 0:
					protection_card_num-=1
					#print(protection_card_num)
					#print("greater-protection")
			elif extra_card_num == 3:
				if counter_card_num > 0:
					counter_card_num-=1
					#print(counter_card_num)
					#print("greater-counter")
			extra_card_num=extra_cards.randi_range(1,3)
			total = magic_card_num+protection_card_num+counter_card_num
		if total == 9 :
			#print(total ," total")
			completed = true
			
			state_of_deck="array"
	if completed == true and state_of_deck=="array":
		for i in magic_card_num:
			deck.append(magic)
		for i in protection_card_num:
			deck.append(protection)
		for i in counter_card_num:
			deck.append(counter)
		print(deck)
		state_of_deck="completed"
		randomize()
		deck.shuffle()
func results():
	if Global.turn==Global.Turns.TURN_RESULTS:
		enemy_hp=enemy_hp-Global.e_damage
		Global.player_hp=Global.player_hp-Global.damage
		Global.turn=Global.Turns.PRE_PLAYER


func attack():
	if Global.turn != Global.Turns.ENEMY:
		return
	var current_attack = deck[0]
	if current_attack in attack_types: 
		attack_action(current_attack)        

func attack_action(current_attack):
	Global.e_move = attack_types[current_attack]
	add_child(current_attack.instance())
	deck.pop_front()
	Global.turn = Global.Turns.TURN_RESULTS   
