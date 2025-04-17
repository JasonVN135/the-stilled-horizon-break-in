extends Control

@onready var label: Label = $PanelContainer/MarginContainer/Label


func _process(delta: float) -> void:
	var inventory = Globals.game_controller.inventory
	var display: String
	var room: String = Globals.game_controller.current_world_name
	if room == Globals.LIVING_ROOM_NAME:
		display = "Living Room: "
		if !inventory.contains(Globals.ITEMS.SCREWDRIVER) \
		or !inventory.contains(Globals.ITEMS.TIME_STREAM_MODULATOR) \
		or !inventory.contains(Globals.ITEMS.NOTE_2):
			display += "Incomplete"
		else:
			display += "Complete"
	elif room == Globals.BED_ROOM_NAME:
		display = "Bedroom: "
		if !inventory.contains(Globals.ITEMS.STUDY_KEY) \
		or !inventory.contains(Globals.ITEMS.CHRONO_CRYSTAL) \
		or !inventory.contains(Globals.ITEMS.PARADOX_RESOLVER_UNIT) \
		or !inventory.contains(Globals.ITEMS.NOTE_3) \
		or !inventory.contains(Globals.ITEMS.NOTE_4):
			display += "Incomplete"
		else:
			display += "Complete"
	elif room == Globals.STUDY_ROOM_NAME:
		display = "Study: "
		if !inventory.contains(Globals.ITEMS.TIME_SUSPENSION_SPHERE) \
		or !inventory.contains(Globals.ITEMS.DOCUMENTS) \
		or !inventory.contains(Globals.ITEMS.NOTE_1):
			display += "Incomplete"
		else:
			display += "Complete"
	label.text = display
