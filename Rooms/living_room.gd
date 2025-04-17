class_name LivingRoom
extends Node2D

@onready var vent : Area2D = $LookAtVent
@onready var screwdriver : Area2D = $ScrewdriverInteract
@onready var time_stream_modulator : Area2D = $TimeStreamModulatorInteract
@onready var door_interact_sfx : AudioStreamPlayer2D = $DoorInteract

func _ready():
	Globals.open_vent.connect(_open_vent)
	time_stream_modulator.monitoring = false

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
			


func _on_look_at_vent_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed('interact'):
			Globals.game_controller.change_gui_scene(Globals.VENT_GUI_NAME)


func _on_screwdriver_interact_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed("interact"):
			Globals.game_controller.inventory.add(Globals.ITEMS.SCREWDRIVER)
			screwdriver.queue_free()

func _open_vent():
	Globals.game_controller.change_gui_scene(Globals.VENT_GUI_NAME)
	time_stream_modulator.monitoring = true
	vent.visible = false
