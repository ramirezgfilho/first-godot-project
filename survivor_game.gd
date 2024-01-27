extends Node2D

var score = 0
var tree_count = 0

func _ready():
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_tree():
	var new_tree = preload("res://tree.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)
	
func _on_mob_died():
	pass

#Tempo para spawnar os mobs, 
#O tempo vai reduzindo até um minimo de 0.1s.
func _on_timer_timeout():
	if %Timer.wait_time > 0.1:
		%Timer.wait_time -= 0.005
		spawn_mob()
	else: 
		spawn_mob()

func _on_player_health_depleted():
	%GameOver.visible = true
	%Score.set_text("Final score: " + str(score))
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

func _on_child_exiting_tree(mob):
	score += 10

func _on_tree_timer_timeout():
	spawn_tree()	


