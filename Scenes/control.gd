extends Node

@onready var node: Sprite2D = $Phoyo
@onready var skinColorSlider: HSlider = $ColorRect/HSlider
@onready var hairColorSlider = $ColorRect/ColorPickerButton
@onready var possibleSkins: Node3D = $Possible

var outfit = {
	"hat": 0,
	"shirt": 0,
	"shoes": 0
}
func _ready() -> void:
	get_all_children(node)


func get_all_children(in_node, arr := []):
	arr.push_back(in_node)
	for child in in_node.get_children():
		get_all_children(child, arr)

		if child is Button:

			child.pressed.connect(func():
				print(child.name)
				print(int(child.name))
				add_outfit(int(child.name), $Body/Skeleton3D)
			)
	
func add_outfit(number, new_parent):
	var node = $Possible.get_node(str(number))
	if new_parent.find_child(str(number)):
		var node2 = $Body/Skeleton3D.get_node(str(number))
		node2.get_parent().remove_child(node2)
		if new_parent.find_child(str(number)):
			node2.get_parent().remove_child(node2) 
			 
		node.global_position = Vector3(0,100,0)
	else:
		new_parent.add_child(node)
		node.global_position = $Body/Skeleton3D.position
		node.rotation = $Body/Skeleton3D.rotation
		$Phoyo.get_node(str(number)).modulate = Color(0.0, 0.0, 0.0, 0.733)
	
	
#var mat = get_node("Body/Skeleton3D/Body_010").get_surface_override_materal(0)
func _on_h_slider_slider_changed(value: float) -> void:
	print(skinColorSlider.value)




@onready var colorP: ColorPickerButton = $ColorRect/ColorPickerButton

func _on_color_picker_button_color_changed(color: Color) -> void:
	print(colorP.color)
	print($Body/Skeleton3D/Body_010.material_override.albedo_color)
	
	$Body/Skeleton3D/Body_010.material_override.albedo_color = colorP.color


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
