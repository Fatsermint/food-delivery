extends Control


@onready var label: Label = $ColorRect/Label

func _process(delta: float) -> void:
	$ColorRect3/Label.text = str(GlobalVariables.money) + "$"
	if GlobalVariables.selecterpicDrop[0] <= 0 and GlobalVariables.selecterpicDrop[1] <= 0:
		$CurrentOrder/Label.text = ""
	else:
		$CurrentOrder/Label.text = "From: Restaurant "+ str(GlobalVariables.selecterpicDrop[0]) + "\nTo: House " + str(GlobalVariables.selecterpicDrop[1])
	if GlobalVariables.selectedOrderValue <= 1:
		$CurrentOrder/Label2.text = str(GlobalVariables.selectedOrderValue) + "$"
	else:
		$CurrentOrder/Label2.text = ""
		
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
	if GlobalVariables.pickDrop[0] <= 0 and GlobalVariables.pickDrop[1] <= 0:
		$ColorRect2/locations.text = "-"
	else:
		$ColorRect2/locations.text = "From: restaurant " + str(GlobalVariables.pickDrop[0])+ "\nTo: House "+ str(GlobalVariables.pickDrop[1]) 

		


func _on_accept_pressed() -> void:
	$ColorRect2.visible = false
	GlobalVariables.selectedOrderValue = GlobalVariables.orderValue
	GlobalVariables.orderValue = 0
	GlobalVariables.selecterpicDrop[0] = GlobalVariables.pickDrop[0]
	GlobalVariables.pickDrop[0]= 0
	GlobalVariables.selecterpicDrop[1] = GlobalVariables.pickDrop[1]
	GlobalVariables.pickDrop[1]= 0
	print(GlobalVariables.selectedOrderValue, GlobalVariables.selecterpicDrop)
	$CurrentOrder/Label2.visible = true
	$Label.visible_ratio = 0
	$Label.text = "First head to pick up the order"
	$Label/AnimationPlayer.play("show")
	$Label/Timer.start()
	
func _on_decline_pressed() -> void:
	$ColorRect2.visible = false
	GlobalVariables.pickDrop[1]= 0
	GlobalVariables.pickDrop[0]= 0
	GlobalVariables.orderValue = 0


func _on_main_order_dropped() -> void:
	$CurrentOrder/Label2.visible = false
	GlobalVariables.money += GlobalVariables.selectedOrderValue
	$Label.text = "You were fast! Now wait for next order"
	$Label.visible_ratio = 0
	$Label/AnimationPlayer.play("show")
	$Label/Timer.start()


func _on_timer_timeout() -> void:
	$Label/AnimationPlayer.play("hide")
	$Label.visible_ratio = 0
	
