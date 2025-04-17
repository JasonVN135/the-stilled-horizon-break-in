class_name GameController
extends Node

## The room that is currently showing
@export var world : Node2D
## The GUI that may appear for puzzles
@export var gui : Control

## The current world/room shown
var current_world_scene : Node2D
var current_world_name: String

## The current gui shown
var current_gui_scene : Control

## A cooldown to prevent the player from repeatedly changing rooms
@onready var change_room_timer : Timer = $ChangeRoomTimer
## The countdown bar for when time is up
@onready var countdown: Control = $Timer
## The inventory 
@onready var inventory: Inventory = $Inventory
## The pause menu
@onready var pause_menu : Control = $CanvasLayer/PauseMenu

## Initialize variables
func _ready() -> void:
	inventory.connect("added_item", _check_game_complete)
	Globals.game_controller = self
	current_world_scene = $World2D/LivingRoom
	current_world_name = Globals.LIVING_ROOM_NAME
	countdown.connect("game_over", _switch_game_over)
	

func close_all_guis() -> void:
	if current_gui_scene != null:
		current_gui_scene.visible = false
		current_gui_scene = null

func change_gui_scene(gui_name : String) -> void:
	
	# Turn off the current gui
	if current_gui_scene != null:
		current_gui_scene.visible = false
	
	var new_gui : Control = gui.get_node(gui_name)
	if new_gui != null:
		if new_gui == current_gui_scene:
			current_gui_scene = null
		else:
			new_gui.visible = true
			current_gui_scene = new_gui

## Function to handle changing between different Worlds
func change_world_scene(world_name : String) -> void:
	change_room_timer.start()
	
	if current_world_scene != null:
		current_world_scene.visible = false
		
	var new_world : Node2D = world.get_node(world_name)
	if new_world != null:
		new_world.visible = true
		current_world_scene = new_world
	
	current_world_name = world_name
	
func _switch_game_over():
	# Do a quick check first to see if the player does have all items
	# in case of edge cases
	TransitionScreen.transition_to_black()
	await TransitionScreen.on_transition_finished
	var tree = TransitionScreen.get_tree()
	tree.change_scene_to_file("res://Menus/game_over_menu.tscn")
	
func switch_game_complete():
	TransitionScreen.transition_to_black()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Menus/game_complete_menu.tscn")
	
func _check_game_complete():
	if !inventory.contains(Globals.ITEMS.CHRONO_CRYSTAL):
		return
	if !inventory.contains(Globals.ITEMS.DOCUMENTS):
		return
	if !inventory.contains(Globals.ITEMS.PARADOX_RESOLVER_UNIT):
		return
	if !inventory.contains(Globals.ITEMS.TIME_STREAM_MODULATOR):
		return
	if !inventory.contains(Globals.ITEMS.TIME_SUSPENSION_SPHERE):
		return
	switch_game_complete()
