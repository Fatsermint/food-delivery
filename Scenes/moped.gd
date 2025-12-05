extends VehicleBody3D

var max_rpm = 300
var max_torque = 150

func _physics_process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("ui_left", "ui_right") * 0.4, 5* delta)
	var accelaration = Input.get_axis("ui_up", "ui_down")
	var rpm = $VehicleWheel3D2.get_rpm()
	$VehicleWheel3D2.engine_force = accelaration * max_torque * (1 - rpm / max_rpm)
	
