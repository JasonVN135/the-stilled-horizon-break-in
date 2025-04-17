class_name StudyRoom
extends Node2D

@onready var time_suspension_sphere : Area2D = $TimeSuspensionSphereInteract
@onready var safe: Area2D = $LookAtSafe
@onready var door_interact_sfx : AudioStreamPlayer2D = $DoorInteract


func _ready() -> void:
	Globals.open_safe.connect(open_safe)
	time_suspension_sphere.monitoring = false


func open_safe():
	Globals.game_controller.change_gui_scene(Globals.SAFE_GUI_NAME)
	time_suspension_sphere.monitoring = true
	safe.visible = false


## Transition to the bedroom if the player clicks the door
func _on_door_to_bedroom_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed('interact') and Globals.game_controller.change_room_timer.is_stopped():
			# Play transition screen and wait for fade to black to finish
			door_interact_sfx.play()
			TransitionScreen.transition_to_black()
			await TransitionScreen.on_transition_finished
			Globals.game_controller.change_world_scene(Globals.BED_ROOM_NAME)
			Globals.game_controller.close_all_guis()


func _on_look_at_safe_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed('interact'):
			Globals.game_controller.change_gui_scene(Globals.SAFE_GUI_NAME)
