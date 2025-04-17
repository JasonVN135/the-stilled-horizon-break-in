class_name Bedroom
extends Node2D

var interact_with_painting : bool = false

@onready var chrono_crystal_interactable : Interactable = $ChronoCrystalInteract
@onready var note_4_interact: Interactable = $Note4Interact
@onready var study_key: Interactable = $StudyKeyInteract
@onready var door_interact_sfx : AudioStreamPlayer2D = $DoorInteract

func _ready() -> void:
	chrono_crystal_interactable.monitoring = false
	note_4_interact.monitoring = false

## Transition to the living room if the player clicks the door
func _on_door_to_living_room_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed('interact') and Globals.game_controller.change_room_timer.is_stopped():
			# Play transition screen and wait for fade to black to finish
			door_interact_sfx.play()
			TransitionScreen.transition_to_black()
			await TransitionScreen.on_transition_finished
			Globals.game_controller.change_world_scene(Globals.LIVING_ROOM_NAME)
			Globals.game_controller.close_all_guis()
			
## Transition to the study room if the player clicks the door
func _on_door_to_study_room_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed('interact') \
		and Globals.game_controller.change_room_timer.is_stopped() \
		and Globals.game_controller.inventory.contains(Globals.ITEMS.STUDY_KEY):
			# Play transition screen and wait for fade to black to finish
			door_interact_sfx.play()
			TransitionScreen.transition_to_black()
			await TransitionScreen.on_transition_finished
			Globals.game_controller.change_world_scene(Globals.STUDY_ROOM_NAME)
			Globals.game_controller.close_all_guis()

## Animation Player for the Move Painting
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	chrono_crystal_interactable.monitoring = true
	note_4_interact.monitoring = true
