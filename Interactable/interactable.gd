class_name Interactable
extends Area2D

@export var item : Item

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and monitoring:
		if Input.is_action_just_pressed("interact"):
			Globals.game_controller.inventory.add(item.item_enum)
			queue_free()
