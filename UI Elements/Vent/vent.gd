extends Control

@onready var screws = $Screws
@onready var vent_grates = $VentLayer

var is_vent_off : bool = false


func _on_vent_layer_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed('interact') and screws.get_children().size() == 0:
			is_vent_off = true
			vent_grates.visible = false
			Globals.open_vent.emit()


func _on_button_pressed() -> void:
	Globals.game_controller.change_gui_scene(Globals.VENT_GUI_NAME)
