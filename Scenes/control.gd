extends Control

@onready var node: Sprite2D = $Phoyo

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
				add_outfit(int(child.name))
				print(child.name)
				print(int(child.name))
				
			)
	
func add_outfit(number):
	if number < 6:
		print("hat") 
