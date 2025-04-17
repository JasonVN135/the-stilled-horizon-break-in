extends Area2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer
var interact_with_painting : bool = false

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed("interact"):
			if !interact_with_painting:
				interact_with_painting = true
				animation_player.play("fall")
