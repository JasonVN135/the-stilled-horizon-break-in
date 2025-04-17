extends Control

@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _ready():
	hide()

## Listen to keyboard inputs
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if !get_tree().paused:
			pause()
		elif get_tree().paused:
			resume()

func resume():
	hide()
	get_tree().paused = false
	animation_player.play_backwards("blur")
	
	
func pause():
	show()
	get_tree().paused = true
	animation_player.play("blur")


func _on_resume_button_pressed() -> void:
	if get_tree().paused:
		resume()


func _on_restart_button_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
