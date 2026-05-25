class_name Waypoint

extends Area3D

enum State {Green, Amber, Red}

var state:State

func assign_color():
	var m:StandardMaterial3D = $MeshInstance3D.get_active_material(0)
	match state:
		State.Green:
			m.albedo_color = Color.GREEN
		State.Amber:
			m.albedo_color = Color.ORANGE
		State.Red:
			m.albedo_color = Color.RED
			
			
			
func _ready() -> void:
	var m:StandardMaterial3D = StandardMaterial3D.new()
	$MeshInstance3D.set_surface_override_material(0, m)
	
	state = randi_range(0, 2)
	assign_color()
	while true:
		var delay = randi_range(4, 10)
		if state == State.Green:
			delay = 4
		await get_tree().create_timer(delay).timeout
		state = (state + 1) % State.size()
		assign_color()
		
		
		
		
		
		
