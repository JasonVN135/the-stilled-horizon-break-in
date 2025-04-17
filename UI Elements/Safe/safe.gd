extends Control

@onready var display: Label = $PanelContainer/MarginContainer/Display

var code: String


func _process(_delta: float) -> void:
	display.text = code
	if code == Globals.SAFE_CODE:
		Globals.open_safe.emit()
	if code.length() == 4:
		code = ""


func _on_exit_pressed() -> void:
	Globals.game_controller.change_gui_scene(Globals.SAFE_GUI_NAME)


func _on_button_1_pressed() -> void:
	print("Pressed 1")
	code += "1"


func _on_button_2_pressed() -> void:
	print("Pressed 2")
	code += "2"


func _on_button_3_pressed() -> void:
	print("Pressed 3")
	code += "3"


func _on_button_4_pressed() -> void:
	print("Pressed 4")
	code += "4"


func _on_button_5_pressed() -> void:
	print("Pressed 5")
	code += "5"


func _on_button_6_pressed() -> void:
	print("Pressed 6")
	code += "6"


func _on_button_7_pressed() -> void:
	print("Pressed 7")
	code += "7"


func _on_button_8_pressed() -> void:
	print("Pressed 8")
	code += "8"


func _on_button_9_pressed() -> void:
	print("Pressed 9")
	code += "9"


func _on_button_0_pressed() -> void:
	print("Pressed 0")
	code += "0"


func _on_button_star_pressed() -> void:
	print("Pressed *")
	code += "*"


func _on_button_pound_pressed() -> void:
	print("Pressed #")
	code += "#"
