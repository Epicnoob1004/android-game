extends Node2D

var over=false


#func _process(delta):
	#if Global.turn=="player":
		#if Input.is_action_just_pressed("mouse"):
			#Global.move="protection"
			#queue_free()
			#Global.turn="enemy"
func _on_Area2D_mouse_entered():
	over=true


func _on_Area2D_mouse_exited():
	over=false


func _on_TouchScreenButton_pressed():
		Global.move=Global.MoveType.PROTECTION
		queue_free()
		Global.turn=Global.Turns.ENEMY
