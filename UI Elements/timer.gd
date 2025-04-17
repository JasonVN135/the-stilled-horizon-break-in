extends Control

signal game_over

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var label: Label = $Label

@export var start_time: float = 65.0

var time_remaining: float

const start_color: Color = Color.GREEN
const end_color: Color = Color.RED


func _ready() -> void:
	time_remaining = start_time
	progress_bar.max_value = start_time


func _process(delta: float) -> void:
	time_remaining = move_toward(time_remaining, 0, delta)
	if time_remaining <= 0.0:
		game_over.emit()
	progress_bar.value = time_remaining
	update_text(time_remaining)
	update_color(time_remaining)


func update_text(time: float):
	@warning_ignore("integer_division")
	var minutes = time as int / 60
	var seconds = time as int % 60
	var string
	if minutes == 0 and seconds <= 10:
		string = "%02.2f" % [time]
		
	else:
		string = "%d:%02d" % [minutes, seconds]
	label.text = string


func update_color(time: float):
	progress_bar.modulate = lerp(end_color, start_color, time / start_time)
