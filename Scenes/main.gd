extends Node3D

@onready var deliveryObjects: Node3D = $"Delivery Objects"
@onready var vespa: VehicleBody3D = $Vespa

@export var ui: Control
@export var map: Node3D
@onready var pickingArea = map.get_picking_area()
@onready var droppingArea = map.get_dropping_area()
var restaurants = 1
var houses = 14
signal newOrder

func _ready() -> void:

	$orderTime.wait_time = randi_range(1,2)
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("E"):
		print(pickingArea.get_overlapping_bodies())
		if pickingArea.get_overlapping_bodies().has(vespa):
			print("pick up") 
			GlobalVariables.pickDrop[0] = 0
			print(GlobalVariables.pickDrop)
		if droppingArea.get_overlapping_bodies().has(vespa):
			print("drop off")



func _new_order():
	
	print("New Order")
	var pickUp
	var dropOff
	pickUp = randi_range(1, restaurants)
	dropOff = randi_range(14, houses)
	GlobalVariables.pickDrop = [pickUp, dropOff]
	GlobalVariables.orderValue = 2.25 + randi_range(0,10)
	newOrder.emit()
func _on_order_time_timeout() -> void:
	_new_order()
	$orderTime.wait_time = randi_range(15,45)
	
