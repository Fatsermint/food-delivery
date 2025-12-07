extends Node3D

@onready var vespa: VehicleBody3D = $Vespa

@export var ui: Control
@export var map: Node3D
@onready var pickingArea = map.get_picking_area()
@onready var droppingArea = map.get_dropping_area()
var restaurants = 2
var houses = 14

signal newOrder
signal orderDropped
signal orderPicked
func _ready() -> void:

	$orderTime.wait_time = randi_range(1,2)
func _process(delta: float) -> void:
	pickingArea = map.get_picking_area()
	if Input.is_action_just_pressed("DO"):
		droppingArea = map.get_dropping_area()
		if pickingArea.get_overlapping_bodies().has(vespa):
			print("pick up") 
			GlobalVariables.selecterpicDrop[0] = 0
			print(GlobalVariables.selecterpicDrop)
			orderPicked.emit()
		if droppingArea.get_overlapping_bodies().has(vespa):
			print("drop off")
			orderDropped.emit()
			GlobalVariables.doingOrder = false


func _new_order():
	if GlobalVariables.doingOrder == false:
		print("New Order")
		var pickUp
		var dropOff
		pickUp = randi_range(1, restaurants)
		dropOff = randi_range(1, houses)
		GlobalVariables.pickDrop = [pickUp, dropOff]
		GlobalVariables.orderValue = 3 + randi_range(-1,12) + randi_range(1,2) * 1.5
		print(GlobalVariables.orderValue)
		newOrder.emit()
func _on_order_time_timeout() -> void:
	if GlobalVariables.Delivering == true: #and GlobalVariables.selectedOrderValue < 0:
		_new_order()
	$orderTime.wait_time = randi_range(1,2)
	
