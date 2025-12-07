extends Control


@onready var label: Label = $ColorRect/Label

func _process(delta: float) -> void:
	$ColorRect3/Label.text = str(GlobalVariables.money) + "$"
	#if GlobalVariables.selecterpicDrop[0] >= 0 and GlobalVariables.selecterpicDrop[1] >= 0:
	#	$CurrentOrder/Label.text = ""
	#else:
	#	$CurrentOrder/Label.text = "From: \n Restaurant "+ str(GlobalVariables.selecterpicDrop[0]) + "\nTo: \n House " + str(GlobalVariables.selecterpicDrop[1])
	if GlobalVariables.selectedOrderValue > 0.9:
		$CurrentOrder/Label2.text = str(GlobalVariables.selectedOrderValue) + "$"
	#else:
		#$CurrentOrder/Label2.text = ""
		
func _on_Delivery_button_pressed() -> void:
	if GlobalVariables.Delivering == true:
		GlobalVariables.Delivering = false
		label.text = "Stop Delivering"
		label.modulate = Color(0.96, 0.0, 0.0, 1.0)
	else:
		label.text = "Start Delivering"
		label.modulate = Color("00ff37") 
		GlobalVariables.Delivering = true
		

signal orderAccepted
func _on_new_order() -> void:
	$ColorRect2.visible = true
	$ColorRect2/value.text = str(GlobalVariables.orderValue)+"$"
	$ColorRect2/locations.text = "From: restaurant " + str(GlobalVariables.pickDrop[0])+ "\nTo: House "+ str(GlobalVariables.pickDrop[1]) 
	print(GlobalVariables.orderValue)
		


func _on_accept_pressed() -> void:
	
	$ColorRect2.visible = false
	$CurrentOrder.visible = true
	$CurrentOrder/Label2.visible = true
	$CurrentOrder/Label2.text = str(GlobalVariables.selectedOrderValue) + "$"
	$Label2.visible_ratio = 0
	$Label2.text = "First head to pick up the order"
	$Label2/AnimationPlayer.play("show")
	$Label2/Timer.start()
	$CurrentOrder/Label.text = "From: restaurant " + str(GlobalVariables.pickDrop[0])+ "\nTo: House "+ str(GlobalVariables.pickDrop[1]) 
	GlobalVariables.selectedOrderValue = GlobalVariables.orderValue
	GlobalVariables.selecterpicDrop[0] = GlobalVariables.pickDrop[0]
	GlobalVariables.selecterpicDrop[1] = GlobalVariables.pickDrop[1]
	print("a")
	GlobalVariables.doingOrder = true
	$Label2.text = "First head to the restaurant!"
	$Label2.visible_ratio = 0
	$Label2/AnimationPlayer.play("show")
	$Label2/Timer.start()
	orderAccepted.emit()
func _on_decline_pressed() -> void:
	$ColorRect2.visible = false
	GlobalVariables.pickDrop[1]= 0
	GlobalVariables.pickDrop[0]= 0
	GlobalVariables.orderValue = 0


func _on_main_order_dropped() -> void:
	$CurrentOrder/Label2.visible = false
	GlobalVariables.money += GlobalVariables.selectedOrderValue
	$Label2.text = "You were fast! Now wait for next order"
	$Label2.visible_ratio = 0
	$Label2/AnimationPlayer.play("show")
	$Label2/Timer.start()
	GlobalVariables.doingOrder = false
	$CurrentOrder/Label.text = ""
	$CurrentOrder/Label2.text = ""
func _on_timer_timeout() -> void:
	$Label2/AnimationPlayer.play("hide")
	$Label2.visible_ratio = 0
	


func _on_order_picked() -> void:
	$Label2.text = "Next head to the customer!"
	$Label2.visible_ratio = 0
	$Label2/AnimationPlayer.play("show")
	$Label2/Timer.start()
