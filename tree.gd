extends StaticBody2D

func _ready():
	%AnimationPlayer.play("idle")

func _on_tree_end_timer_timeout():
	%AnimationPlayer.play("tree_fall")
	await %AnimationPlayer.animation_finished
	queue_free()
