extends Node3D

@onready var d = $"Houses"
@onready var sphere: CSGSphere3D = $"Delivery Objects/CSGSphere3D"
signal orderPicked
@onready var p = $"Open Truck/pickingArea"
func get_picking_area():
	if GlobalVariables.selecterpicDrop[0] == 1:
		p = $"Open Truck/pickingArea"
	else:
		p = $Box002/pickingArea
	return p
	
func get_dropping_area():
	if d.find_child(str(GlobalVariables.selecterpicDrop[1])):
		var almost = $Houses.get_node(str(GlobalVariables.selecterpicDrop[1]))
		var droppingArea = almost.get_node("DropArea")
		print(droppingArea, "a")
		return droppingArea
	
@onready var ball = $"Delivery Objects/CSGSphere3D"
var ballPosition = 0
func _on_order_picked() -> void:
	ballPosition = GlobalVariables.selecterpicDrop[1]
	ball.global_position = $Houses.get_node(str(GlobalVariables.selecterpicDrop[1])).global_position + Vector3(0,15,0)
	orderPicked.emit()
	var rightHouse = $Houses.get_node(str(GlobalVariables.selecterpicDrop[1]))
	$CSGCylinder3D.global_position = rightHouse.get_node("DropArea").global_position

func _on_order_dropped() -> void:
	$"Delivery Objects".get_node(str(sphere)).position = Vector3(0,500,0)
	$CSGCylinder3D.visible = false

func _on_delivery_ui_order_accepted() -> void:
	ball.global_position = p.get_parent().global_position + Vector3(0,15,0)
	if GlobalVariables.selecterpicDrop[0] == 1:
		$CSGCylinder3D.visible = true
		$CSGCylinder3D.global_position = $"Open Truck/pickingArea".global_position
		print(p,$CSGCylinder3D.global_position)
	else:
		$CSGCylinder3D.visible = true
		$CSGCylinder3D.global_position = $Box002/pickingArea.global_position
		print(p,$CSGCylinder3D.global_position)
