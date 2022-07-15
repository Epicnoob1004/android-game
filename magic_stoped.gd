extends Node2D


func _ready():
	$AnimatedSprite.frame=0
	yield(get_tree().create_timer(1),"timeout")
	$AnimatedSprite.play()

func _on_AnimatedSprite_animation_finished():
	queue_free()
