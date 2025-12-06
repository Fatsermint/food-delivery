extends Control


@onready var label: Label = $ColorRect/Label



func _on_Delivery_button_pressed() -> void:
	if GlobalVariables.Delivering == true:
		GlobalVariables.Delivering = false
		label.text = "Stop Delivering"
		label.modulate = Color(0.96, 0.0, 0.0, 1.0)
	else:
		label.text = "Start Delivering"
		label.modulate = Color("00ff37") 
		GlobalVariables.Delivering = true
		


func _on_new_order() -> void:
	$ColorRect2.visible = true
	$ColorRect2/value.text = str(GlobalVariables.orderValue)+"$"
	$ColorRect2/locations.text = "From: restaurant " + str(GlobalVariables.pickDrop[0])+ "\nTo: House "+ str(GlobalVariables.pickDrop[1]) 
