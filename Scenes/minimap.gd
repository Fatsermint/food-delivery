extends SubViewportContainer



func _process(delta: float) -> void:
	$SubViewport/Camera3D.position = $"../Vespa".position + Vector3(0,75,0)
