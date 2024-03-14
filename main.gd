extends Node3D

@export var min_x : float
@export var max_x : float
@export var min_n : int
@export var max_n : int

@export var num_num : int
@export var num_dist : float

@export var number_scene : PackedScene
@export var number_node : Node

@onready var num_list = []

@onready var root_node = get_tree().get_root().get_child(0)


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, num_num):
		var x = randf_range(min_x, max_x)
		#var n = randi_range(min_n, max_n)
		var n = 0
		if num_list != []:
			n = num_list[len(num_list)-1] + 1
		
		#while n in num_list:
			#n = randi_range(min_n, max_n)
		
		var new_num = number_scene.instantiate()
		new_num.num = n
		new_num.position.z = x
		new_num.position.x = 5
		new_num.position.y = len(num_list) * num_dist
		num_list.append(n)
		number_node.add_child(new_num)
		
		print(num_list)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
