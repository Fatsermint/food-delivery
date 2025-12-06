extends Node3D


@export var ui: Control

@onready var button = ui.get_child(0).get_child(1)
@onready var label = ui.get_child(0).get_child(0)



func _process(delta: float) -> void:
	button.pressed.connect(delivery_button_pressed)
	
func delivery_button_pressed():
		if GlobalVariables.Delivering == false:
			label.text = "Stop Delivering"
			label.modulate = Color(0.96, 0.0, 0.0, 1.0)
			GlobalVariables.Delivering = true
		else:
			label.text = "Start Delivering"
			label.modulate = Color("00ff37")
			GlobalVariables.Delivering = false
