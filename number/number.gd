extends StaticBody3D
class_name Number

@export var num : int
@onready var mesh : MeshInstance3D = get_node("MeshInstance3D")

# Called when the node enters the scene tree for the first time.
func _ready():
	mesh.mesh.text = str(num)

func change_num(n):
	num = n
	mesh.mesh.text = str(num)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
