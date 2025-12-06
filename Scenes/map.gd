extends Node3D

@onready var d = $"Houses/14/DropArea"

@onready var p = $"Open Truck/pickingArea"
func get_picking_area():
	return p
func get_dropping_area():
	return d
