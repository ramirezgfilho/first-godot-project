extends StaticBody2D

func _ready():
	%AnimationPlayer.play("idle")

func _on_tree_end_timer_timeout():
	%AnimationPlayer.play("tree_fall")
	await %AnimationPlayer.animation_finished
	queue_free()
	
	const SMOKE_SCENE = preload("res://smoke_tree_explosion/smoke_tree_explosion.tscn")
	var smoke = SMOKE_SCENE.instantiate()
	get_parent().add_child(smoke)
	smoke.global_position = global_position
