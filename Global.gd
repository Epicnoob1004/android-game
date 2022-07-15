extends Node
var e_move:int
var move:int 
var e_damage=0
var damage=0
var player_hp=9
var magic_stoped = preload("res://assets/magic_stoped.tscn")
var shield_counter = preload("res://assets/counter_shield.tscn")
var addc
enum MoveType {NONE,MAGIC, PROTECTION, COUNTER}
enum Turns {NONE,PLAYER, ENEMY, RESULTS,TURN_RESULTS,PRE_PLAYER}
var turn = Turns.PLAYER
func _process(delta):
	if turn == Turns.PRE_PLAYER:
		yield(get_tree().create_timer(2),"timeout")
		damage = 0
		e_damage = 0
		turn = Turns.PLAYER
###
	match move:
		MoveType.MAGIC:
			match e_move:
				MoveType.PROTECTION:
					move(0, 0, magic_stoped.instance())
				MoveType.MAGIC:
					move(1, 1, null)
				MoveType.COUNTER:
					move(0, 1, null)
		MoveType.COUNTER:
			match e_move:
				MoveType.PROTECTION:
					move(0, 1, shield_counter.instance())
				MoveType.MAGIC:
					move(1, 0, null)
				MoveType.COUNTER:
					move(0, 0, null)
				#move(player_damage,enemy_damage,animation)
		MoveType.MAGIC:
			match e_move:
				MoveType.MAGIC:
					move(1, 1, null)
				MoveType.PROTECTION:
					move(0, 0, magic_stoped.instance())
				MoveType.COUNTER:
					move(0, 1, null)
###


	match e_move:
		MoveType.MAGIC:
			match move:
				MoveType.PROTECTION:
					move(0, 0, magic_stoped.instance())
				MoveType.MAGIC:
					move(1, 1, null)
				MoveType.COUNTER:
					move(1, 0, null)
		MoveType.COUNTER:
			match move:
				MoveType.PROTECTION:
					move(1, 0, shield_counter.instance())
				MoveType.MAGIC:
					move(0, 1, null)
				MoveType.COUNTER:
					move(0, 0, null)
				#move(player_damage,enemy_damage,animation)
		MoveType.MAGIC:
			match move:
				MoveType.MAGIC:
					move(1, 1, null)
				MoveType.PROTECTION:
					move(0, 0, magic_stoped.instance())
				MoveType.COUNTER:
					move(1, 0, null)


func move(pre_damage, pre_e_damage, addc):
	damage=pre_damage
	e_damage=pre_e_damage
	print(e_damage)
	if addc != null:
		get_node("/root/Node2D/animations").add_child(addc)
	move = 0
	e_move = 0
	turn = Turns.TURN_RESULTS

		
	
	
