extends Control

@onready var label: Label = $Label
@onready var inv: Inventory = $Inventory

var display: String

func _ready():
	inv.add(Globals.ITEMS.CHRONO_CRYSTAL)
	inv.add(Globals.ITEMS.DOCUMENTS)
	inv.add(Globals.ITEMS.PARADOX_RESOLVER_UNIT)
	inv.add(Globals.ITEMS.TIME_STREAM_MODULATOR)
	inv.add(Globals.ITEMS.TIME_SUSPENSION_SPHERE)
	for child in inv.items.get_children():
		child.modulate = Color(.5, .5, .5)

func _process(_delta: float) -> void:
	for item : Item in inv.items.get_children():
		
		if item.item_enum == Globals.ITEMS.CHRONO_CRYSTAL:
			if Globals.game_controller.inventory.contains(Globals.ITEMS.CHRONO_CRYSTAL):
				item.modulate = Color(1, 1, 1)
		elif item.item_enum == Globals.ITEMS.DOCUMENTS:
			if Globals.game_controller.inventory.contains(Globals.ITEMS.DOCUMENTS):
				item.modulate = Color(1, 1, 1)
		elif item.item_enum == Globals.ITEMS.PARADOX_RESOLVER_UNIT:
			if Globals.game_controller.inventory.contains(Globals.ITEMS.PARADOX_RESOLVER_UNIT):
				item.modulate = Color(1, 1, 1)
		elif item.item_enum == Globals.ITEMS.TIME_STREAM_MODULATOR:
			if Globals.game_controller.inventory.contains(Globals.ITEMS.TIME_STREAM_MODULATOR):
				item.modulate = Color(1, 1, 1)
		elif item.item_enum == Globals.ITEMS.TIME_SUSPENSION_SPHERE:
			if Globals.game_controller.inventory.contains(Globals.ITEMS.TIME_SUSPENSION_SPHERE):
				item.modulate = Color(1, 1, 1)
