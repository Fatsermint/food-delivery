extends VehicleBody3D

var max_rpm = 200
var max_torque = 75

func _physics_process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("right", "left") * 0.4, 5 * delta)
	var acceleration = Input.get_axis("down", "forward") * 100
	var rpm = $VehicleWheel3D.get_rpm()
	$VehicleWheel3D.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)


func _on_control_on_player_ready(player: Node3D) -> void:
	print(player)
	add_child(player)
	player.global_position = $Circle.global_position
