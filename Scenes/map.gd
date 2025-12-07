extends Node3D

@onready var d = $"Houses"

@onready var p = $"Open Truck/pickingArea"
func get_picking_area():
	
	return p
func get_dropping_area():
	if d.find_child(str(GlobalVariables.selecterpicDrop[1])):
		print("aaaa")
		var almost = $Houses.get_node(str(GlobalVariables.selecterpicDrop[1]))
		var droppingArea = almost.get_node("DropArea")
		print(droppingArea, "a")
		return droppingArea
	


func _on_order_picked() -> void:
	var ball = $"Delivery Objects/CSGSphere3D".duplicate()
	#$Houses.get_node(str(GlobalVariables.selecterpicDrop[1])).add_child(ball)
	#ball.position = Vector3(0,30,0)
	
