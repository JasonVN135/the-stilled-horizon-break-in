extends Control


func _on_play_button_pressed() -> void:
	TransitionScreen.transition_to_black()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Menus/game_controller.tscn")


func _on_story_button_pressed() -> void:
	TransitionScreen.transition_to_black()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Menus/story_menu.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
