class_name Inventory
extends PanelContainer

@export var items: GridContainer

signal added_item

func contains(item: Globals.ITEMS):
	for i: Item in items.get_children():
		if i.item_enum == item:
			return true
	return false
	
func add(item_name):
	var new_item: Item
	match (item_name):
		Globals.ITEMS.STUDY_KEY:
			new_item = Globals.STUDY_KEY_ITEM.instantiate()
			items.add_child(new_item)
		Globals.ITEMS.SCREWDRIVER:
			new_item = Globals.SCREWDRIVER_ITEM.instantiate()
			items.add_child(new_item)
		Globals.ITEMS.CHRONO_CRYSTAL:
			new_item = Globals.CHRONO_CRYSTAL_ITEM.instantiate()
			items.add_child(new_item)
		Globals.ITEMS.DOCUMENTS:
			new_item = Globals.DOCUMENTS_ITEM.instantiate()
			items.add_child(new_item)
		Globals.ITEMS.PARADOX_RESOLVER_UNIT:
			new_item = Globals.PARADOX_RESOLVER_UNIT_ITEM.instantiate()
			items.add_child(new_item)
		Globals.ITEMS.TIME_STREAM_MODULATOR:
			new_item = Globals.TIME_STREAM_MODULATOR_ITEM.instantiate()
			items.add_child(new_item)
		Globals.ITEMS.TIME_SUSPENSION_SPHERE:
			new_item = Globals.TIME_SUSPENSION_SPHERE_ITEM.instantiate()
			items.add_child(new_item)
		Globals.ITEMS.NOTE_1:
			new_item = Globals.NOTE_1_ITEM.instantiate()
			items.add_child(new_item)
		Globals.ITEMS.NOTE_2:
			new_item = Globals.NOTE_2_ITEM.instantiate()
			items.add_child(new_item)
		Globals.ITEMS.NOTE_3:
			new_item = Globals.NOTE_3_ITEM.instantiate()
			items.add_child(new_item)
		Globals.ITEMS.NOTE_4:
			new_item = Globals.NOTE_4_ITEM.instantiate()
			items.add_child(new_item)
		_:
			print("nothing added")
	added_item.emit()
