extends Node

signal open_safe
signal open_vent

var game_controller : GameController
	
const LIVING_ROOM_NAME : String = "LivingRoom"
const STUDY_ROOM_NAME : String = "StudyRoom"
const BED_ROOM_NAME : String = "Bedroom"

const STUDY_KEY_ITEM = preload("res://Items/Tools/study_key_item.tscn")
const SCREWDRIVER_ITEM = preload("res://Items/Tools/screwdriver_item.tscn")
const CHRONO_CRYSTAL_ITEM = preload("res://Items/Gadgets/chrono_crystal_item.tscn")
const DOCUMENTS_ITEM = preload("res://Items/Gadgets/documents_item.tscn")
const PARADOX_RESOLVER_UNIT_ITEM = preload("res://Items/Gadgets/paradox_resolver_unit_item.tscn")
const TIME_STREAM_MODULATOR_ITEM = preload("res://Items/Gadgets/time_stream_modulator_item.tscn")
const TIME_SUSPENSION_SPHERE_ITEM = preload("res://Items/Gadgets/time_suspension_sphere_item.tscn")
const NOTE_1_ITEM = preload("res://Items/Notes/note_1_item.tscn")
const NOTE_2_ITEM = preload("res://Items/Notes/note_2_item.tscn")
const NOTE_3_ITEM = preload("res://Items/Notes/note_3_item.tscn")
const NOTE_4_ITEM = preload("res://Items/Notes/note_4_item.tscn")


const VENT_GUI_NAME = "Vent"
const SAFE_GUI_NAME = "Safe"

const SAFE_CODE = "08#4"


enum ITEMS {
	SCREWDRIVER,
	STUDY_KEY,
	CHRONO_CRYSTAL,
	DOCUMENTS,
	PARADOX_RESOLVER_UNIT,
	TIME_STREAM_MODULATOR,
	TIME_SUSPENSION_SPHERE,
	NOTE_1,
	NOTE_2,
	NOTE_3,
	NOTE_4
}
