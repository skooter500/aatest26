extends Node3D

@export var radius = 20
@export var count = 10

@export var waypoint:PackedScene

var index = 0

func _ready() -> void:
	var theta_inc:float = PI / (count * 0.5) 
	for i in range(count):
		var x = sin(i * theta_inc) * radius
		var y = cos(i * theta_inc) * radius
		var w = waypoint.instantiate()
		w.position = Vector3(x, 0, y)
		add_child(w) 
		
func _process(delta: float) -> void:
	var red:int = 0 
	var amber:int = 0 
	var green:int = 0 
	for child in get_children():
		if child.state == Waypoint.State.Green:
			green += 1
		if child.state == Waypoint.State.Amber:
			amber += 1
		if child.state == Waypoint.State.Red:
			red += 1

	$"../green".text = "Green: " + str(green)
	$"../amber".text = "Amber: " + str(amber)
	$"../red".text = "Red: " + str(red)
			
