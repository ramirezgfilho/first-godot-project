extends Node2D

var score = 0

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _on_timer_timeout():
	spawn_mob()

func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true

func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_pause_button_pressed():
	%GamePaused.visible = true
	%PauseButton.visible = false
	get_tree().paused = true

func _on_resume_button_pressed():
	get_tree().paused = false
	%GamePaused.visible = false
	%PauseButton.visible = true

func _on_exit_button_pressed():
	get_tree().quit()

func _physics_process(delta):
	%ScoreText.set_text(str(score))

func _on_score_timer_timeout():
	score += 1

