extends Area2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed('interact'):
			if Globals.game_controller.inventory.contains(Globals.ITEMS.SCREWDRIVER):
				animation_player.play("turn")


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	queue_free()
